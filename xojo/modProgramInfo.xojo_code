#tag Module
Protected Module modProgramInfo
	#tag Method, Flags = &h0
		Function GetProgramInfo() As modProgramInfo.ProgramInfo()
		  dim server-ip as string
		  dim program-info-extension as string
		  dim jsReturn as string
		  dim ReturnClasses() as modProgramInfo.ProgramInfo
		  
		  server-ip = "104.207.143.15"
		  program-info-extension = "/get-program-info"
		  
		  dim sock as new HTTPSocket
		  
		  jsReturn = sock.Get(server-ip + program-info-extenstion, 30)
		  
		  
		End Function
	#tag EndMethod


End Module
#tag EndModule
