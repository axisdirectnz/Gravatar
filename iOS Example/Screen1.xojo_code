#tag MobileScreen
Begin MobileScreen Screen1
   BackButtonCaption=   ""
   Compatibility   =   ""
   ControlCount    =   0
   HasNavigationBar=   True
   LargeTitleDisplayMode=   2
   Left            =   0
   TabBarVisible   =   True
   TabIcon         =   0
   TintColor       =   "&h00000000"
   Title           =   "Untitled"
   Top             =   0
   Begin MobileLabel Label1
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      Alignment       =   0
      AutoLayout      =   Label1, 1, <Parent>, 1, False, +1.00, 4, 1, *kStdGapCtlToViewH, , True
      AutoLayout      =   Label1, 7, , 0, False, +1.00, 4, 1, 48, , True
      AutoLayout      =   Label1, 3, TopLayoutGuide, 4, False, +1.00, 4, 1, *kStdControlGapV, , True
      AutoLayout      =   Label1, 8, , 0, False, +1.00, 4, 1, 30, , True
      ControlCount    =   0
      Enabled         =   True
      Height          =   30
      Left            =   20
      LineBreakMode   =   0
      LockedInPosition=   False
      Scope           =   0
      Text            =   "Email"
      TextColor       =   &c000000
      TextFont        =   ""
      TextSize        =   0
      TintColor       =   ""
      Top             =   73
      Visible         =   True
      Width           =   48
   End
   Begin MobileTextField TextField1
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      Alignment       =   0
      AllowAutoCorrection=   False
      AllowSpellChecking=   False
      AutoCapitalizationType=   0
      AutoLayout      =   TextField1, 1, Label1, 2, False, +1.00, 4, 1, *kStdControlGapH, , True
      AutoLayout      =   TextField1, 7, , 0, False, +1.00, 4, 1, 159, , True
      AutoLayout      =   TextField1, 8, , 0, True, +1.00, 4, 1, 31, , True
      AutoLayout      =   TextField1, 11, Label1, 11, False, +1.00, 4, 1, 0, , True
      BorderStyle     =   3
      ControlCount    =   0
      Enabled         =   True
      Height          =   31
      Hint            =   ""
      InputType       =   0
      Left            =   76
      LockedInPosition=   False
      Password        =   False
      ReadOnly        =   False
      ReturnCaption   =   0
      Scope           =   0
      Text            =   "Untitled"
      TextColor       =   &c000000
      TextFont        =   ""
      TextSize        =   0
      TintColor       =   ""
      Top             =   72
      Visible         =   True
      Width           =   159
   End
   Begin MobileButton Button1
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      AutoLayout      =   Button1, 1, TextField1, 1, False, +1.00, 4, 1, 0, , True
      AutoLayout      =   Button1, 7, , 0, False, +1.00, 4, 1, 100, , True
      AutoLayout      =   Button1, 3, TextField1, 4, False, +1.00, 4, 1, *kStdControlGapV, , True
      AutoLayout      =   Button1, 8, , 0, False, +1.00, 4, 1, 30, , True
      Caption         =   "Ok"
      CaptionColor    =   &c007AFF00
      ControlCount    =   0
      Enabled         =   True
      Height          =   30
      Left            =   76
      LockedInPosition=   False
      Scope           =   0
      TextFont        =   ""
      TextSize        =   0
      TintColor       =   ""
      Top             =   111
      Visible         =   True
      Width           =   100
   End
   Begin MobileImageViewer ImageViewer1
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      AutoLayout      =   ImageViewer1, 1, Label1, 1, False, +1.00, 4, 1, 0, , True
      AutoLayout      =   ImageViewer1, 7, , 0, False, +1.00, 4, 1, 160, , True
      AutoLayout      =   ImageViewer1, 3, Button1, 4, False, +1.00, 4, 1, *kStdControlGapV, , True
      AutoLayout      =   ImageViewer1, 8, , 0, False, +1.00, 4, 1, 160, , True
      ControlCount    =   0
      DisplayMode     =   0
      Enabled         =   True
      Height          =   160
      Image           =   0
      Left            =   20
      LockedInPosition=   False
      Scope           =   0
      TintColor       =   ""
      Top             =   149
      Visible         =   True
      Width           =   160
   End
   Begin MobileLabel Label2
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      Alignment       =   0
      AutoLayout      =   Label2, 1, ImageViewer1, 1, False, +1.00, 4, 1, 0, , True
      AutoLayout      =   Label2, 2, ImageViewer1, 2, False, +1.00, 4, 1, 0, , True
      AutoLayout      =   Label2, 3, ImageViewer1, 4, False, +1.00, 4, 1, *kStdControlGapV, , True
      AutoLayout      =   Label2, 8, , 0, False, +1.00, 4, 1, 30, , True
      ControlCount    =   0
      Enabled         =   True
      Height          =   30
      Left            =   20
      LineBreakMode   =   0
      LockedInPosition=   False
      Scope           =   0
      Text            =   ""
      TextColor       =   &c000000
      TextFont        =   ""
      TextSize        =   0
      TintColor       =   ""
      Top             =   317
      Visible         =   True
      Width           =   160
   End
   Begin GravatarConnection Gravatar
      AllowCertificateValidation=   False
      email           =   ""
      Height          =   32
      Height          =   "32"
      HTTPStatusCode  =   0
      Left            =   160
      Left            =   160
      LockedInPosition=   False
      PanelIndex      =   -1
      Parent          =   ""
      Scope           =   0
      Top             =   160
      Top             =   160
      Width           =   32
      Width           =   "32"
   End
End
#tag EndMobileScreen

#tag WindowCode
#tag EndWindowCode

#tag Events Button1
	#tag Event
		Sub Pressed()
		  Gravatar.GetAvatar(TextField1.Text)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Gravatar
	#tag Event
		Sub Avatar(Value As Picture)
		  ImageViewer1.Image = Value
		  Gravatar.GetProfile(TextField1.Text)
		End Sub
	#tag EndEvent
	#tag Event
		Sub Found(FullName As String, Location As String, AvatarURL As String)
		  Label2.Text = FullName
		End Sub
	#tag EndEvent
#tag EndEvents
