@echo off
SET hwid="PCI\VEN_168C&DEV_0029&CC_0280"
devcon64 disable %hwid%
sleep 3
devcon64 enable %hwid%
