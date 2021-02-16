function intOutFlag = StartRecordingSGL(hSGL)
	%StartRecordingSGL Starts recording (if not already recording
	%   [hSGL,strRunName,sParamsSGL] = InitSGL(strRecording,strHostAddress,boolStart)
	
	%default flag
	intOutFlag = 0;
	
	if IsSaving(hSGL)
		%already recording
		intOutFlag = 1;
	else
		%turn on recording
		SetRecordingEnable(hSGL, 1);
		hTicStart = tic;
		
		%check if output is being saved
		while ~IsSaving(hSGL) && toc(hTicStart) < 1
			pause(0.01);
		end
		if ~IsSaving(hSGL)
			error([mfilename ':NotSaving'],'Data is not being saved!')
		end
	end
end
