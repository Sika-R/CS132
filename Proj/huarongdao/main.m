close all
clear all
clc
chess = Chess;
engine = GameEngine;
mapp = game;
% mapp.Chess = chess;
mapp.Engine = engine;
engine.initBoard();
% engine.moveChess(8, 'up')
% engine.moveChess(7, 'right')
% [a, b ,d] = engine.moveChess(4, 'down')
% engine.updateChessBoard(8, b, c);
c = engine.chessBoard;