classdef Chess < handle
    properties
        name
        pos
        size
    end
    
    methods
        function setPos(chess, x, y)
            chess.pos = [x, y];
        end
        
        function newpos = moveChess(chess, direction)
            switch direction
                case 'up'
                    chess.pos = [chess.pos(0), chess.pos(1) + 60];
                case 'down'
                    chess.pos = [chess.pos(0), chess.pos(1) - 60];
                case 'left'
                    chess.pos = [chess.pos(0) - 60, chess.pos(1)];
                case 'right'
                    chess.pos = [chess.pos(0) + 60, chess.pos(1)];
            end
        end
        

        
        
            
                    
        
    end
end
