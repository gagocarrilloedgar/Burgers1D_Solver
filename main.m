%% Computational Engineering | Burgers' Equation
% Author: Gago, Edgar
% Date 28/10/2020
% Subject: Comp. Engineering
%% Core of the program

clc
clear;
close all;

%% Inputs
Inputs;

%% Code Core
[Ek_save,it,time_] = CodeCore(N,Re,delta,Ct,ck,ops);

%% Data PostProcess
PostProcess(Ek_save, N,Re,Ct)
