classdef Request < handle
    %REQUST �˴���ʾ�йش����ժҪ
    %   �˴���ʾ��ϸ˵��
    
    properties
        device
        start
        destination
        direction
        status
        time
        button
        icon
    end
    
    methods
        function CalculateTime(request)
            a = datestr(now);
            s = str2num(a(end - 1 : end));
            min = str2num(a(end - 4 : end - 3));
            h = str2num(a(end - 7 : end - 6));

            request.time = s + min * 60 + h * 3600;
        end
        
    end
end

