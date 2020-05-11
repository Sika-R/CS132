classdef RequestDB < handle
    %REQUESTDB 此处显示有关此类的摘要
    %   此处显示详细说明
    
    properties
        requestList
    end
    
    methods
        function result = equal(DB,request)
            result = 0;
            if length(DB.requestList) >= 1
                for i=1:length(DB.requestList)
                    if (DB.requestList(i).destination==request.destination)&strcmp(DB.requestList(i).direction,request.direction)&strcmp(DB.requestList(i).status,request.status)
                        result = 1;
                        break
                    end
                end
            end
        end
        function register(DB, request)
            succ = 0;
            if length(DB.requestList) >= 1
                for i=1:length(DB.requestList)
                    if DB.equal(request)
                        succ = 1;
                        break
                    end
                end
                if succ == 0
                    DB.requestList = [DB.requestList;request];
                end
            else
                DB.requestList = [DB.requestList;request];
            end   
        end
        function registerFloor(DB, request)
            succ = 0;
            if length(DB.requestList) >= 1
                for i=1:length(DB.requestList)
                    if DB.equal(request)
                        succ = 1;
                        DB.requestList(i) = request;
                        break
                    end
                end
                if succ == 0
                    DB.requestList = [DB.requestList;request];
                end
            else
                DB.requestList = [DB.requestList;request];
            end   
        end
        function addfront(DB, request)
            succ = 0;
            if length(DB.requestList) >= 1
                for i=1:length(DB.requestList)
                    if DB.equal(request)
                        succ = 1;
                        break
                    end
                end
                if succ == 0
                    DB.requestList = [request;DB.requestList];
                end
            else
                DB.requestList = [request;DB.requestList];
            end
        end
        function list=retrieve(DB)
            list=DB.requestList;
        end
        function delete(DB, request)
            Locate = find(DB.requestList==request);
            DB.requestList(Locate)=[];
        end
    end
end

