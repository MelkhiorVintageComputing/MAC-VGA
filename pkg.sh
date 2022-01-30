#!/bin/bash

GERBER_FILES="MAC-VGA-B.Cu.gbr MAC-VGA-B.Mask.gbr MAC-VGA-B.Paste.gbr MAC-VGA-B.SilkS.gbr MAC-VGA-Edge.Cuts.gbr MAC-VGA-F.Cu.gbr MAC-VGA-F.Mask.gbr MAC-VGA-F.Paste.gbr MAC-VGA-F.SilkS.gbr"

POS_FILES="MAC-VGA-top.pos"

DRL_FILES="MAC-VGA-NPTH.drl MAC-VGA-PTH.drl MAC-VGA-PTH-drl_map.ps MAC-VGA-NPTH-drl_map.ps"

FILES="${GERBER_FILES} ${POS_FILES} ${DRL_FILES} top.pdf MAC-VGA.d356 MAC-VGA.csv"

echo $FILES

KICAD_PCB=MAC-VGA.kicad_pcb

ABORT=no
for F in $FILES; do 
    if test \! -f $F || test $KICAD_PCB -nt $F; then
	echo "Regenerate file $F"
	ABORT=yes
    fi
done

if test $ABORT == "yes"; then
    exit -1;
fi

zip MAC-VGA.zip $FILES
