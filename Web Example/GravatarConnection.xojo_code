#tag Class
Protected Class GravatarConnection
Inherits URLConnection
	#tag Event
		Sub ContentReceived(URL As String, HTTPStatus As Integer, content As String)
		  If HTTPStatus = 404 Then
		    RaiseEvent NotFound
		    Return
		  End If
		  
		  If URL.BeginsWith("HTTPS://www.gravatar.com/avatar/") Then
		    Var pic As Picture = Picture.FromData(content)
		    RaiseEvent Avatar(pic)
		  Else
		    Var d As Dictionary = ParseJSON(content)
		    Var v() As Variant = d.value("entry")
		    Var entry As Dictionary = v(0)
		    Var names As Dictionary = entry.Value("name")
		    v = entry.Value("photos")
		    Var Avatar As Dictionary = v(0)
		    RaiseEvent Found(names.Lookup("formatted", ""), entry.Lookup("currentLocation", ""), Avatar.Lookup("value", ""))
		  End If
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h21
		Private Function GenerateGravatarHash(email As String) As String
		  // Generate Gravatar Hash
		  Var m As New MD5Digest
		  m.Process(email)
		  Var hash As String = EncodeHex(m.Value).Lowercase
		  
		  Return hash
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub GetAvatar(email As String, size As Integer = 80)
		  Send("GET", "https://www.gravatar.com/avatar/" + GenerateGravatarHash(email) + "?size=" + size.ToString)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub GetProfile(email As String)
		  Send("GET", "HTTPS://www.gravatar.com/" + GenerateGravatarHash(email) + ".json")
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event Avatar(Value As Picture)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event Found(FullName As String, Location As String, AvatarURL As String)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event NotFound()
	#tag EndHook


	#tag ViewBehavior
		#tag ViewProperty
			Name="AllowCertificateValidation"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="HTTPStatusCode"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
