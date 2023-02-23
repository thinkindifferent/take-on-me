Fs=8000; %Sampling frequency
NoteFrequency5=880; %note A5=880Hz
NoteFrequency4=440; %note A4=440Hz

%All note frequencies (in concert pitch)
F4=NoteFrequency4*2^(8/12);
Db4=NoteFrequency4*2^(4/12);
Bb4=NoteFrequency4*2^(1/12);
Eb4=NoteFrequency4*2^(6/12);
G4=NoteFrequency4*2^(10/12);
Ab4=NoteFrequency4*2^(11/12);
Bb5=NoteFrequency5*2^(1/12);

%Note lengths (using quarter note = 0.25 sec = 2000 samples)
EighthNote=0:1/Fs:0.125;
QuarterNote=0:1/Fs:0.25;
HalfNote=0:1/Fs:0.5;
WholeNote=0:1/Fs:1;
Gap=0:1/Fs:0.0625; %length of a 32nd note gap to be applied between notes

%Using custom ADSR function to apply ADSR to each note length
ADSR_eighth=ADSR(EighthNote);
ADSR_qtr=ADSR(QuarterNote);
ADSR_half=ADSR(HalfNote);
ADSR_whole=ADSR(WholeNote);

%Synthesized notes using the note freq's and lengths, multiplied by ADSR
eighthNoteF4=sin(2*pi*F4*EighthNote).*ADSR_eighth;
eighthNoteDb4=sin(2*pi*Db4*EighthNote).*ADSR_eighth;
eighthNoteBb4=sin(2*pi*Bb4*EighthNote).*ADSR_eighth;
eighthNoteEb4=sin(2*pi*Eb4*EighthNote).*ADSR_eighth;
eighthNoteG4=sin(2*pi*G4*EighthNote).*ADSR_eighth;
eighthNoteAb4=sin(2*pi*Ab4*EighthNote).*ADSR_eighth;
eighthNoteBb5=sin(2*pi*Bb5*EighthNote).*ADSR_eighth;

%Rest vector implemented exactly like note length
eighthRest=0:1/Fs:0.125;

%Concatenate all notes and add a gap between, slurred notes will have
%no gap
music=[eighthNoteF4 Gap eighthNoteF4 Gap eighthNoteDb4 Gap eighthNoteBb4 Gap eighthRest Gap eighthNoteBb4 Gap eighthRest Gap eighthNoteEb4 Gap eighthRest Gap eighthNoteEb4 Gap eighthRest Gap eighthNoteEb4 Gap eighthNoteG4 Gap eighthNoteG4 Gap eighthNoteAb4 eighthNoteBb5 Gap eighthNoteAb4 Gap eighthNoteAb4 Gap eighthNoteAb4 Gap eighthNoteEb4 Gap eighthRest Gap eighthNoteDb4 Gap eighthRest Gap eighthNoteF4 Gap eighthRest Gap eighthNoteF4 Gap eighthRest Gap eighthNoteF4 Gap eighthNoteEb4 Gap eighthNoteEb4 Gap eighthNoteF4 eighthNoteEb4];
sound(music,Fs);

plot(music);