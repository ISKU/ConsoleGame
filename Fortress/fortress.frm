VERSION 5.00
Begin VB.Form Form1 
   BackColor       =   &H00FFFFFF&
   Caption         =   "Form1"
   ClientHeight    =   10950
   ClientLeft      =   120
   ClientTop       =   450
   ClientWidth     =   18720
   LinkTopic       =   "Form1"
   ScaleHeight     =   10950
   ScaleWidth      =   18720
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton START 
      BackColor       =   &H00FFFFFF&
      Caption         =   "START"
      Height          =   855
      Left            =   16920
      MaskColor       =   &H00FFFFFF&
      Style           =   1  'Graphical
      TabIndex        =   0
      Top             =   9240
      Width           =   1335
   End
   Begin VB.Timer Timer4 
      Left            =   18000
      Top             =   840
   End
   Begin VB.Timer Timer3 
      Left            =   240
      Top             =   840
   End
   Begin VB.Timer Timer2 
      Left            =   18000
      Top             =   240
   End
   Begin VB.Timer Timer1 
      Left            =   240
      Top             =   240
   End
   Begin VB.Label PlayerTurn 
      Alignment       =   2  'Center
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "PLAYER 1"
      ForeColor       =   &H00FFFFFF&
      Height          =   555
      Left            =   6090
      TabIndex        =   3
      Top             =   8640
      Visible         =   0   'False
      Width           =   2955
   End
   Begin VB.Image P2 
      Height          =   555
      Left            =   4800
      Picture         =   "포트리스.frx":0000
      Stretch         =   -1  'True
      Top             =   8640
      Visible         =   0   'False
      Width           =   735
   End
   Begin VB.Image P1 
      Height          =   555
      Left            =   4800
      Picture         =   "포트리스.frx":0F75
      Stretch         =   -1  'True
      Top             =   8640
      Visible         =   0   'False
      Width           =   735
   End
   Begin VB.Label Label1 
      BackStyle       =   0  'Transparent
      Caption         =   "˚"
      ForeColor       =   &H00FFFFFF&
      Height          =   375
      Left            =   2280
      TabIndex        =   2
      Top             =   9880
      Width           =   495
   End
   Begin VB.Label AngleValue 
      Alignment       =   2  'Center
      BackStyle       =   0  'Transparent
      Caption         =   "0"
      ForeColor       =   &H00FFFFFF&
      Height          =   255
      Left            =   1320
      TabIndex        =   1
      Top             =   9880
      Width           =   1695
   End
   Begin VB.Line Angle 
      BorderColor     =   &H00FFFFFF&
      BorderWidth     =   2
      X1              =   2160
      X2              =   3240
      Y1              =   9510
      Y2              =   9510
   End
   Begin VB.Shape P2_ENERGY 
      BackColor       =   &H0000C000&
      BackStyle       =   1  'Opaque
      Height          =   345
      Left            =   6600
      Top             =   9360
      Visible         =   0   'False
      Width           =   9300
   End
   Begin VB.Shape P1_ENERGY 
      BackColor       =   &H0000C000&
      BackStyle       =   1  'Opaque
      Height          =   345
      Left            =   6600
      Top             =   9360
      Width           =   9300
   End
   Begin VB.Shape xMove 
      BackColor       =   &H0000C0C0&
      BackStyle       =   1  'Opaque
      Height          =   345
      Left            =   6600
      Top             =   10320
      Width           =   9300
   End
   Begin VB.Shape POWER 
      BackColor       =   &H000000FF&
      BackStyle       =   1  'Opaque
      Height          =   345
      Left            =   6600
      Top             =   9840
      Width           =   60
   End
   Begin VB.Image Image4 
      Height          =   2775
      Left            =   0
      Picture         =   "포트리스.frx":23EB
      Stretch         =   -1  'True
      Top             =   8160
      Width           =   18720
   End
   Begin VB.Image Fire_R 
      Height          =   1950
      Left            =   7200
      Picture         =   "포트리스.frx":78EB
      Top             =   2880
      Visible         =   0   'False
      Width           =   1335
   End
   Begin VB.Image Fire_L 
      Height          =   1950
      Left            =   9960
      Picture         =   "포트리스.frx":9100
      Top             =   2760
      Visible         =   0   'False
      Width           =   1335
   End
   Begin VB.Image Tank2_L 
      Height          =   1065
      Left            =   17400
      Picture         =   "포트리스.frx":A923
      Top             =   4080
      Width           =   1350
   End
   Begin VB.Image Tank2_R 
      Height          =   1065
      Left            =   17400
      Picture         =   "포트리스.frx":B898
      Top             =   3120
      Visible         =   0   'False
      Width           =   1350
   End
   Begin VB.Image Tank1_R 
      Height          =   1065
      Left            =   0
      Picture         =   "포트리스.frx":C75F
      Top             =   4080
      Width           =   1350
   End
   Begin VB.Image Tank1_L 
      Height          =   1065
      Left            =   0
      Picture         =   "포트리스.frx":DC1D
      Top             =   3120
      Visible         =   0   'False
      Width           =   1350
   End
   Begin VB.Image Tile 
      Height          =   3750
      Left            =   0
      Picture         =   "포트리스.frx":F093
      Top             =   4920
      Width           =   18750
   End
   Begin VB.Image BooM_R 
      Height          =   600
      Left            =   8640
      Picture         =   "포트리스.frx":3205A
      Top             =   2880
      Visible         =   0   'False
      Width           =   450
   End
   Begin VB.Image BooM_L 
      Height          =   600
      Left            =   9480
      Picture         =   "포트리스.frx":326BB
      Top             =   2880
      Visible         =   0   'False
      Width           =   450
   End
   Begin VB.Image Image1 
      Height          =   2250
      Index           =   2
      Left            =   15480
      Picture         =   "포트리스.frx":32D2B
      Top             =   0
      Width           =   2250
   End
   Begin VB.Image Image2 
      Height          =   2250
      Index           =   1
      Left            =   11280
      Picture         =   "포트리스.frx":43645
      Top             =   480
      Width           =   2250
   End
   Begin VB.Image Image1 
      Height          =   2250
      Index           =   1
      Left            =   8040
      Picture         =   "포트리스.frx":53F5F
      Top             =   -120
      Width           =   2250
   End
   Begin VB.Image Image2 
      Height          =   2370
      Index           =   0
      Left            =   4680
      Picture         =   "포트리스.frx":64879
      Stretch         =   -1  'True
      Top             =   240
      Width           =   2130
   End
   Begin VB.Image Image1 
      Height          =   2250
      Index           =   0
      Left            =   1560
      Picture         =   "포트리스.frx":75193
      Top             =   -240
      Width           =   2250
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim Turn, T, BT, ST, TT, theta, RightAngle

Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)

    If Turn = 1 Then
    
    Select Case KeyCode
    Case vbKeyLeft
    If Tank1_R.Visible = True Then
    Tank1_L.Left = Val(Tank1_R.Left)
    Tank1_L.Top = Val(Tank1_R.Top)
    Tank1_L.Visible = True
    Tank1_R.Visible = False
    
    Angle.X2 = 2160 - (Val(Angle.X2) - 2160)
    End If
    
    If xMove.Width > 154 Then
    xMove.Width = xMove.Width - 154
    Tank1_L.Left = Tank1_L.Left - 25
    End If
    
    Case vbKeyRight
    If Tank1_L.Visible = True Then
    Tank1_R.Left = Val(Tank1_L.Left)
    Tank1_R.Top = Val(Tank1_L.Top)
    Tank1_R.Visible = True
    Tank1_L.Visible = False
    
    Angle.X2 = 2160 + (2160 - Val(Angle.X2))
    End If
    
    If xMove.Width > 154 Then
    xMove.Width = xMove.Width - 154
    Tank1_R.Left = Tank1_R.Left + 25
    End If
    
    Case vbKeySpace
    If POWER.Width < 9240 Then
    POWER.Width = POWER.Width + 57.75
    Timer3.Enabled = True
    Timer3.Interval = 1
    ST = 0
    Else
    POWER.Width = 60
    End If
    
    Case vbKeyUp
    If Tank1_R.Visible = True And Val(AngleValue.Caption) < 90 And Val(AngleValue.Caption) >= 0 Then
    Angle.X2 = Val(Angle.X2) - 12
    Angle.Y2 = Val(Angle.Y2) - 12
    theta = theta + (1 * 3.1415926535 / 180)
    AngleValue.Caption = Val(AngleValue.Caption) + 1
    ElseIf Tank1_L.Visible = True And Val(AngleValue.Caption) < 90 And Val(AngleValue.Caption) >= 0 Then
    Angle.X2 = Val(Angle.X2) + 12
    Angle.Y2 = Val(Angle.Y2) - 12
    theta = theta + (1 * 3.1415926535 / 180)
    AngleValue.Caption = Val(AngleValue.Caption) + 1
    End If
    
    Case vbKeyDown
    If Tank1_R.Visible = True And Val(AngleValue.Caption) <= 90 And Val(AngleValue.Caption) > 0 Then
    Angle.X2 = Val(Angle.X2) + 12
    Angle.Y2 = Val(Angle.Y2) + 12
    theta = theta - (1 * 3.1415926535 / 180)
    AngleValue.Caption = Val(AngleValue.Caption) - 1
    ElseIf Tank1_L.Visible = True And Val(AngleValue.Caption) <= 90 And Val(AngleValue.Caption) > 0 Then
    Angle.X2 = Val(Angle.X2) - 12
    Angle.Y2 = Val(Angle.Y2) + 12
    theta = theta - (1 * 3.1415926535 / 180)
    AngleValue.Caption = Val(AngleValue.Caption) - 1
    End If
    
    End Select
    End If
    
    
    
    
    
    If Turn = 2 Then
    
    Select Case KeyCode
    Case vbKeyLeft
    If Tank2_R.Visible = True Then
    Tank2_L.Left = Val(Tank2_R.Left)
    Tank2_L.Top = Val(Tank2_R.Top)
    Tank2_L.Visible = True
    Tank2_R.Visible = False
    
    Angle.X2 = 2160 + (2160 - Val(Angle.X2))
    End If
    
    If xMove.Width > 154 Then
    xMove.Width = xMove.Width - 154
    Tank2_L.Left = Tank2_L.Left - 25
    End If
    
    Case vbKeyRight
    If Tank2_L.Visible = True Then
    Tank2_R.Left = Val(Tank2_L.Left)
    Tank2_R.Top = Val(Tank2_L.Top)
    Tank2_R.Visible = True
    Tank2_L.Visible = False
    
    Angle.X2 = 2160 - (Val(Angle.X2) - 2160)
    End If
    
    If xMove.Width > 154 Then
    xMove.Width = xMove.Width - 154
    Tank2_R.Left = Tank2_R.Left + 25
    End If
    
    Case vbKeySpace
    If POWER.Width < 9240 Then
    POWER.Width = POWER.Width + 57.75
    Timer3.Enabled = True
    Timer3.Interval = 1
    ST = 0
    Else
    POWER.Width = 60
    End If
    
    Case vbKeyUp
    If Tank2_R.Visible = True And Val(AngleValue.Caption) < 90 And Val(AngleValue.Caption) >= 0 Then
    Angle.X2 = Val(Angle.X2) - 12
    Angle.Y2 = Val(Angle.Y2) - 12
    theta = theta + (1 * 3.1415926535 / 180)
    AngleValue.Caption = Val(AngleValue.Caption) + 1
    ElseIf Tank2_L.Visible = True And Val(AngleValue.Caption) < 90 And Val(AngleValue.Caption) >= 0 Then
    Angle.X2 = Val(Angle.X2) + 12
    Angle.Y2 = Val(Angle.Y2) - 12
    theta = theta + (1 * 3.1415926535 / 180)
    AngleValue.Caption = Val(AngleValue.Caption) + 1
    End If
    
    Case vbKeyDown
    If Tank2_R.Visible = True And Val(AngleValue.Caption) <= 90 And Val(AngleValue.Caption) > 0 Then
    Angle.X2 = Val(Angle.X2) + 12
    Angle.Y2 = Val(Angle.Y2) + 12
    theta = theta - (1 * 3.1415926535 / 180)
    AngleValue.Caption = Val(AngleValue.Caption) - 1
    ElseIf Tank2_L.Visible = True And Val(AngleValue.Caption) <= 90 And Val(AngleValue.Caption) > 0 Then
    Angle.X2 = Val(Angle.X2) - 12
    Angle.Y2 = Val(Angle.Y2) + 12
    theta = theta - (1 * 3.1415926535 / 180)
    AngleValue.Caption = Val(AngleValue.Caption) - 1
    End If
    
    End Select
    End If

End Sub

Private Sub START_Click()

    RightAngle = 90 * 3.1415926535 / 180
    theta = 0
    
    T = 0
    BT = 0
    ST = 0
    TT = 0

    PlayerTurn.FontSize = 15
    PlayerTurn.Visible = True
    P1.Visible = True
    
    Timer1.Interval = 1
    Timer1.Enabled = True

    START.Visible = False

End Sub

Private Sub Timer1_Timer()

    Turn = 1
    
    
    
    If Tank1_L.Visible = True And Angle.X2 > 2610 Then
    Angle.X2 = 2160 - (Val(Angle.X2) - 2160)
    ElseIf Tank1_R.Visible = True And Angle.X2 < 2160 Then
    Angle.X2 = 2160 + (2160 - Val(Angle.X2))
    End If
    
    
    
    
    If Tank1_R.Left > 2600 And Tank1_R.Top < 5520 Then
    Turn = 0
    T = T + 1
    Tank1_R.Top = Tank1_R.Top + 0.5 * T * T
    ElseIf Tank1_R.Left > 4450 And Tank1_R.Top < 6800 Then
    Turn = 0
    T = T + 1
    Tank1_R.Top = Tank1_R.Top + 0.5 * T * T
    Else
    T = 0
    End If
    
    
    
    
    If Tank1_R.Visible = True And POWER.Width > 60 And Timer3.Enabled = False Then
    Turn = 3
    BT = BT + 1
    
    BooM_R.Visible = True
    BooM_R.Left = Val(Tank1_R.Left) + ((POWER.Width - 60) / 57.75) * Sin(RightAngle - theta) * BT
    BooM_R.Top = Val(Tank1_R.Top) - ((POWER.Width - 60) / 57.75) * Cos(RightAngle - theta) * BT + 0.5 * BT * BT
    
    Timer4.Enabled = True
    Timer4.Interval = 1
    
    ElseIf Tank1_L.Visible = True And POWER.Width > 60 And Timer3.Enabled = False Then
    Turn = 3
    BT = BT + 1
   
    BooM_L.Visible = True
    BooM_L.Left = Val(Tank1_L.Left) - ((POWER.Width - 60) / 57.75) * Sin(RightAngle - theta) * BT
    BooM_L.Top = Val(Tank1_L.Top) - ((POWER.Width - 60) / 57.75) * Cos(RightAngle - theta) * BT + 0.5 * BT * BT
    
    Timer4.Enabled = True
    Timer4.Interval = 1

    Else
    BT = 0
    End If
    
    
    
    
    If Tank2_L.Visible = True And ((BooM_R.Left > Tank2_L.Left And BooM_R.Left < Tank2_L.Left + Tank2_L.Width) Or (BooM_L.Left > Tank2_L.Left And BooM_L.Left < Tank2_L.Left + Tank2_L.Width)) And ((BooM_R.Top > Tank2_L.Top And BooM_R.Top < Tank2_L.Top + Tank2_L.Height) Or (BooM_L.Top > Tank2_L.Top And BooM_L.Top < Tank2_L.Top + Tank2_L.Height)) Then
    BooM_R.Visible = False
    BooM_L.Visible = False
    BooM_R.Move 0, 0
    BooM_L.Move 0, 0
    
    Fire_L.Left = Val(Tank2_L.Left)
    Fire_L.Top = Val(Tank2_L.Top) - Tank2_L.Height / 2
    Fire_L.Visible = True
    
    P2_ENERGY.Width = P2_ENERGY.Width - 1848
    
    Timer1.Enabled = False
    End If
    
    If Tank2_R.Visible = True And ((BooM_R.Left > Tank2_R.Left And BooM_R.Left < Tank2_R.Left + Tank2_R.Width) Or (BooM_L.Left > Tank2_R.Left And BooM_L.Left < Tank2_R.Left + Tank2_R.Width)) And ((BooM_R.Top > Tank2_R.Top And BooM_R.Top < Tank2_R.Top + Tank2_R.Height) Or (BooM_L.Top > Tank2_R.Top And BooM_L.Top < Tank2_R.Top + Tank2_R.Height)) Then
    BooM_R.Visible = False
    BooM_L.Visible = False
    BooM_R.Move 0, 0
    BooM_L.Move 0, 0
    
    Fire_R.Left = Val(Tank2_R.Left)
    Fire_R.Top = Val(Tank2_R.Top) - Tank2_R.Height / 2
    Fire_R.Visible = True
    
    P2_ENERGY.Width = P2_ENERGY.Width - 1848
    
    Timer1.Enabled = False
    End If
    

End Sub

Private Sub Timer2_Timer()

    Turn = 2
    
    
    
    If Tank2_L.Visible = True And Angle.X2 > 2610 Then
    Angle.X2 = 2160 - (Val(Angle.X2) - 2160)
    ElseIf Tank2_R.Visible = True And Angle.X2 < 2160 Then
    Angle.X2 = 2160 + (2160 - Val(Angle.X2))
    End If
    
    
    
    
    If Tank2_L.Left < 15000 And Tank2_L.Top < 5520 Then
    Turn = 0
    T = T + 1
    Tank2_L.Top = Tank2_L.Top + 0.5 * T * T
    ElseIf Tank2_L.Left < 13080 And Tank2_L.Top < 6800 Then
    Turn = 0
    T = T + 1
    Tank2_L.Top = Tank2_L.Top + 0.5 * T * T
    Else
    T = 0
    End If
    
    
    
    
    If Tank2_L.Visible = True And POWER.Width > 60 And Timer3.Enabled = False Then
    Turn = 4
    BT = BT + 1
    
    BooM_L.Visible = True
    BooM_L.Left = Val(Tank2_L.Left) - ((POWER.Width - 60) / 57.75) * Sin(RightAngle - theta) * BT
    BooM_L.Top = Val(Tank2_L.Top) - ((POWER.Width - 60) / 57.75) * Cos(RightAngle - theta) * BT + 0.5 * BT * BT

    Timer4.Enabled = True
    Timer4.Interval = 1

    ElseIf Tank2_R.Visible = True And POWER.Width > 60 And Timer3.Enabled = False Then
    Turn = 4
    BT = BT + 1
    
    BooM_R.Visible = True
    BooM_R.Left = Val(Tank2_R.Left) + ((POWER.Width - 60) / 57.75) * Sin(RightAngle - theta) * BT
    BooM_R.Top = Val(Tank2_R.Top) - ((POWER.Width - 60) / 57.75) * Cos(RightAngle - theta) * BT + 0.5 * BT * BT
    
    Timer4.Enabled = True
    Timer4.Interval = 1
    
    Else
    BT = 0
    End If
    
    
    
    
    If Tank1_L.Visible = True And ((BooM_R.Left > Tank1_L.Left And BooM_R.Left < Tank1_L.Left + Tank1_L.Width) Or (BooM_L.Left > Tank1_L.Left And BooM_L.Left < Tank1_L.Left + Tank1_L.Width)) And ((BooM_R.Top > Tank1_L.Top And BooM_R.Top < Tank1_L.Top + Tank1_L.Height) Or (BooM_L.Top > Tank1_L.Top And BooM_L.Top < Tank1_L.Top + Tank1_L.Height)) Then
    BooM_R.Visible = False
    BooM_L.Visible = False
    BooM_R.Move 0, 0
    BooM_L.Move 0, 0
    
    Fire_L.Left = Val(Tank1_L.Left)
    Fire_L.Top = Val(Tank1_L.Top) - Tank1_L.Height / 2
    Fire_L.Visible = True
    
    P1_ENERGY.Width = P1_ENERGY.Width - 1848
    
    Timer2.Enabled = False
    End If
  
    
    
    If Tank1_R.Visible = True And ((BooM_R.Left > Tank1_R.Left And BooM_R.Left < Tank1_R.Left + Tank1_R.Width) Or (BooM_L.Left > Tank1_R.Left And BooM_L.Left < Tank1_R.Left + Tank1_R.Width)) And ((BooM_R.Top > Tank1_R.Top And BooM_R.Top < Tank1_R.Top + Tank1_R.Height) Or (BooM_L.Top > Tank1_R.Top And BooM_L.Top < Tank1_R.Top + Tank1_R.Height)) Then
    BooM_R.Visible = False
    BooM_L.Visible = False
    BooM_R.Move 0, 0
    BooM_L.Move 0, 0
    
    Fire_R.Left = Val(Tank1_R.Left)
    Fire_R.Top = Val(Tank1_R.Top) - Tank1_R.Height / 2
    Fire_R.Visible = True
    
    P1_ENERGY.Width = P1_ENERGY.Width - 1848
    
    Timer2.Enabled = False
    End If
    
    
    
    

End Sub

Private Sub Timer3_Timer()

    ST = ST + 1
    
    If ST = 35 Then
    Timer3.Enabled = False
    ST = 0
    End If

End Sub

Private Sub Timer4_Timer()

    TT = TT + 1


    If TT = 400 And Turn = 3 Then
    Turn = 2
    
    Fire_R.Visible = False
    Fire_L.Visible = False
    BooM_R.Visible = False
    BooM_L.Visible = False
    P2_ENERGY.Visible = True
    P1_ENERGY.Visible = False
    
    BooM_R.Move 0, 0
    BooM_L.Move 0, 0
    
    xMove.Width = 9300
    POWER.Width = 60

    Timer1.Enabled = False
    Timer2.Enabled = True
    Timer2.Interval = 1
    
    PlayerTurn.FontSize = 15
    PlayerTurn.Caption = " PLAYER 2 "
    P1.Visible = False
    P2.Visible = True
    
    TT = 0
    Timer4.Enabled = False
    End If



    If TT = 400 And Turn = 4 Then
    Turn = 1
    
    BooM_R.Visible = False
    BooM_L.Visible = False
    Fire_R.Visible = False
    Fire_L.Visible = False
    P1_ENERGY.Visible = True
    P2_ENERGY.Visible = False
    
    BooM_R.Move 0, 0
    BooM_L.Move 0, 0
    
    xMove.Width = 9300
    POWER.Width = 60
    
    Timer2.Enabled = False
    Timer1.Enabled = True
    Timer1.Interval = 1

    PlayerTurn.FontSize = 15
    PlayerTurn.Caption = " PLAYER 1 "
    P2.Visible = False
    P1.Visible = True
    
    TT = 0
    Timer4.Enabled = False
    End If
    
    
    
    
    If P1_ENERGY.Width = 60 Then
    MsgBox " PLAYER 2 Win "
    Timer4.Enabled = False
    ElseIf P2_ENERGY.Width = 60 Then
    MsgBox " PLAYER 1 Win "
    Timer4.Enabled = False
    End If

End Sub
