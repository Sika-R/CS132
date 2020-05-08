classdef GameEngine < handle
    properties
        chessList;
        chessBoard;
    end
    methods
        function initBoard(engine)
            engine.chessBoard = [2, 1, 1, 3; 2, 1, 1, 3; 4, 6, 6, 5; 4, 0, 0, 5; 7, 8, 9, 10];
        end
        
        function l = findChess(engine, no)
            l = find(engine.chessBoard == no);
%             pos = [];
%             for i = l
%                 y = mod(i, 5);
%                 if y == 0
%                     y = 5;
%                 end
%                 x = (i - y) / 5;
%                 pos = [pos; [y, x + 1]];
%             end
%             pos = pos';
        end 
        
        function [suc, newpos] = moveChess(engine, no, direction)
            pos = engine.findChess(no);
            newpos = [];
            suc = true;
            switch direction
                case 'up'
                    for i = pos
                        newpos = [newpos; [i(1) - 1, i(2)]];
                    end
                case 'down'
                    for i = pos
                        newpos = [newpos; [i(1) + 1, i(2)]];
                    end
                case 'left'
                    for i = pos
                        newpos = [newpos; [i(1), i(2) - 1]];
                    end
                case 'right'
                    for i = pos
                        newpos = [newpos; [i(1), i(2) + 1]];
                    end
            end
            newpos = newpos';
            if newpos <= 0
                suc = false;
                newpos = [];
            else
                for i = newpos
                   
                    engine.chessBoard([4, 2])
                    if engine.chessBoard(i) > 0
                        suc = false;
                        newpos = [];
                        break;
                    end
                end
            end
            
            
            
        end
        
        
    end
    
end
