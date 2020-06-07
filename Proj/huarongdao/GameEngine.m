classdef GameEngine < handle
    properties
        chessList;
        chessBoard;
    end
    methods
        
        function randomBoard(engine)
            engine.chessBoard = zeros(5, 4);
            tmp_loc = [1, 2, 3, 6, 7, 8, 11, 12, 13];
            tmp = tmp_loc(randperm(9, 1));
            engine.chessBoard(tmp:tmp + 1) = [1, 1];
            engine.chessBoard(tmp + 5 :tmp + 6) = [1, 1];
            zero_lists = [];
            for i = 1 : 5
                for j = 1 : 4
                    if i < 5 && isequal(engine.chessBoard(i : i + 1, j), [0; 0])
                        zero_lists = [zero_lists; [(j - 1) * 5 + i, (j - 1) * 5 + i + 1]];
                    end
                    if j < 4 && isequal(engine.chessBoard(i, j :j + 1), [0, 0])
                        zero_lists = [zero_lists; [(j - 1) * 5 + i, j * 5 + i]];
                    end
                end
            end
            possible_pos = randperm(size(zero_lists, 1));
            big_cnt = 0;
            i = 1;
            while big_cnt < 5 && i < size(zero_lists, 1)
                if engine.chessBoard(zero_lists(possible_pos(i), 1)) == 0 && engine.chessBoard(zero_lists(possible_pos(i), 2)) == 0
                    big_cnt = big_cnt + 1;
                    engine.chessBoard(zero_lists(possible_pos(i), 1)) = big_cnt + 1;
                    engine.chessBoard(zero_lists(possible_pos(i), 2)) = big_cnt + 1;
                end
                i = i + 1;
            end
            tmp_loc = find(engine.chessBoard == 0, 6);
            possible_pos = randperm(6, 4);
            for i = 1 : 4
                engine.chessBoard(tmp_loc(possible_pos(i))) = i + 6;
            end
            engine.chessBoard
        end
        
        function initBoard(engine)
            engine.chessBoard = [2, 1, 1, 3; 2, 1, 1, 3; 6, 4, 4, 5; 6, 0, 0, 5; 7, 8, 9, 10];
        end
        
        function suc = verifySuccess(engine)
            l = find(engine.chessBoard == 1);
            if l == [9; 10; 14; 15]
                suc = true;
            else
                suc = false;
            end
        end
        
        
        function pos = findChess(engine, no)
            l = find(engine.chessBoard == no);
            pos = [];
            for i = 1 : numel(l)
                y = mod(l(i), 5);
                if y == 0
                    y = 5;
                end
                x = (l(i) - y) / 5;
                pos = [pos; [y, x + 1]];
            end
            pos = pos';
        end 
        
        function [suc, pos, newpos] = moveChess(engine, no, direction)
            pos = engine.findChess(no);
            newpos = [];
            suc = true;
            switch direction
                case 'up'
                    for i = pos
                        newpos = [newpos; [i(1) - 1, i(2)]];
                        if i(1) - 1 <= 0
                            suc = false;
                            break;
                        end
                    end
                case 'down'
                    for i = pos
                        newpos = [newpos; [i(1) + 1, i(2)]];
                        if i(1) + 1 > 5
                            suc = false;
                            break;
                        end
                    end
                case 'left'
                    for i = pos
                        newpos = [newpos; [i(1), i(2) - 1]];
                        if i(2) - 1 <= 0
                            suc = false;
                            break
                        end
                    end
                case 'right'
                    for i = pos
                        newpos = [newpos; [i(1), i(2) + 1]];
                        if i(2) + 1 > 4
                            suc = false;
                            break
                        end
                    end
            end
            
            
            newpos = newpos';
            if suc == false
                newpos = [];
            else
                for i = newpos
                    if engine.chessBoard(i(1), i(2)) > 0
                        a = 0;
                        for j = pos
                            if i == j
                                a = 1;
                                break;
                            end
                        end
                        if a == 0
                            suc = false;
                            newpos = [];
                            break;
                        end
                    end
                end
            end
            newpos = newpos;
            
            if suc == true
                engine.updateChessBoard(no, pos, newpos)
            end
        end
        
        function updateChessBoard(engine, no, pos, newpos)
            if length(pos') == 2 && length(pos) == 1
                engine.chessBoard(pos(1), pos(2)) = 0;
            else
                for i = pos
                    engine.chessBoard(i(1), i(2)) = 0;
                end
            end
            
            
            if length(newpos') == 2 && length(newpos) == 1
                engine.chessBoard(newpos(1), newpos(2)) = no;
            else
                for i = newpos
                    engine.chessBoard(i(1), i(2)) = no;
                end
            end
            
            
        end
        
        
        
    end
    
end
