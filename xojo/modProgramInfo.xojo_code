#tag Module
Protected Module modProgramInfo
	#tag Method, Flags = &h1
		Protected Function GetProgramByName(sName as String) As modProgramInfo.ProgramInfo
		  
		  For Each program as modProgramInfo.ProgramInfo In ProgramInfoList
		    If program.name = sName Then
		      Return program
		    End If
		  Next
		  
		  Return Nil
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub GetProgramInfo()
		  dim sock as New HTTPSocket
		  
		  
		  
		  dim s1 as string
		  s1 = sock.Get("104.207.143.15:5000/program-info", 30)
		  dim jsGetReturn as New JSONItem(s1)
		  
		  For Each ProgramName as string In jsGetReturn.Names
		    
		    dim jsProgramInfo as JSONItem = jsGetReturn.Value(ProgramName)
		    
		    dim piProgramInfo as New modProgramInfo.ProgramInfo
		    dim avverstring as string = jsProgramInfo.Value("available-versions")
		    piProgramInfo.AvailableVersions = avverstring.Split(",")
		    piProgramInfo.name = ProgramName
		    
		    ProgramInfoList.Append(piProgramInfo)
		  Next
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		ProgramInfoList() As modProgramInfo.ProgramInfo
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
	#tag EndViewBehavior
End Module
#tag EndModule
