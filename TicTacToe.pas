Program TicTacToe;
Uses crt,bibmat;
Var
  M: tmat;
  i: tindl;
  j: tindc;
  q: Boolean;
  a,b: Integer;

Function GameOver(m:tmat): Boolean;
Var
  h: tindl;
  k: tindc;
  p: Boolean;
Begin
  p := False;
  For h:=1 To 3 Do
    Begin
      If (m[h,1]=m[h,2]) And (m[h,2]=m[h,3]) And ((m[h,1]=2) Or (m[h,1]=1)) Then
        Begin
          p := True;
        End;
    End;
  For k:= 1 To 3 Do
    Begin
      If (m[1,k]=m[2,k]) And (m[2,k]=m[3,k]) And ((m[1,k]=1) Or (m[1,k]=2)) Then
        Begin
          ;
          p := True ;
        End;
    End;
  If (m[1,1]=m[2,2]) And (m[2,2]=m[3,3]) And ((m[2,2]=2) Or (m[2,2]=1)) Then
    Begin
      p := True;
    End;
  If (m[3,1]=m[2,2]) And (m[2,2]=m[1,3]) And ((m[2,2]=2) Or (m[2,2]=1)) Then
    Begin
      p := True;
    End;
  GameOver := p;
End;

Procedure loading;
Begin
  Writeln;
  Write('                                                                  Attendez SVP');
  delay(800);
  Write('  .');
  delay(800);
  Write('  .');
  delay(800);
  Write('  .');
  delay(1000);
End;

Procedure ecriremat(Var mtrx:tmat);
Var
  x: tindl;
  y: tindc;
Begin
  Writeln;
  Writeln;
  Writeln;
  Writeln;
  Writeln;
  Writeln;
  Writeln;
  Writeln;
  Writeln;
  Writeln;
  Writeln;
  Writeln;
  Writeln('                                                                         1   2   3');
  For x:= 1 To 3 Do
    Begin
      Write('                                                                    ',x,'  |');
      For y:= 1 To 3 Do
        Begin
          If mtrx[x,y]=2 Then Write(' X |')
          Else
            Begin
              If mtrx[x,y]=1 Then Write(' O |')
              Else Write('   |');
            End;
        End;
      Writeln;
      Writeln;
    End;
End;

Procedure TourJoueur(Var i:tindl;Var j:tindc;Var m:tmat);
Begin
  Writeln;
  Writeln;
  Writeln;
  Write('                                                              Choisissez une ligne: ');
  Readln(i);
  Write('                                                              Choisissez une colonne: ');
  Readln(j);
End;

Procedure rangcase( m:tmat; Var i:tindl; Var j:tindc;t:Longint;Var q:Boolean);
Var
  e,v: tindl ;
  f,w: tindc;
  x,y:integer;
Begin
  i := 1;
  q := False;
  While (i<4) And Not q Do
    Begin
      j := 1;
      While (j<4) And Not q Do
        Begin
          v := i;
          w := j;
          If m[i,j]=t Then
            Begin
              i := 1 ;
              While (i<4) And Not q Do
                Begin
                  j := 1;
                  While (j<4) And Not q Do
                    Begin
                      If (m[i,j]=t) And (( (Abs(j-w)=1) and (abs(i-v)<2)) Or ((abs(j-w)<2) and (Abs(i-v)=1))) Then
                        Begin
                          If i=v Then
                            Begin
                              For f:=1 To 3 Do
                                Begin
                                  If m[i,f]=0 Then
                                    Begin
                                      j := f ;
                                      q := True;
                                    End;
                                End;
                            End
                          Else
                            Begin
                              If j=w Then
                                Begin
                                  For e:=1 To 3 Do
                                    Begin
                                      If m[e,j]=0 Then
                                        Begin
                                          i := e;
                                          q := True;
                                        End;
                                    End;
                                End
                              Else
                                Begin
                                  If ((i=j) And (w=v)) Then
                                    Begin
                                      e := 1;
                                      f := 1;
                                      While (e<4) And (f<4) Do
                                        Begin
                                          If m[e,f]=0 Then
                                            Begin
                                              i := e;
                                              j := f;
                                              q := True;
                                            End;
                                          e := e+1 ;
                                          f := f+1;
                                        End
                                    End
                                  Else
                                    Begin
                                    if ((v=1) and (w=3)) or ((v=2) and (w=2)) or ((v=3) and (w=1)) then
                                    begin
                                      e := 1;
                                      f := 3;
                                      While (e<4) And (f>0) Do
                                        Begin
                                          If m[e,f]=0 Then
                                            Begin
                                              i := e;
                                              j := f;
                                              q := True;
                                            End;
                                          e := e+1;
                                          If e<>4 Then f := f-1;
                                        End;
                                    End;
                                    end;
                                End;
                            End;
                          e := i;
                          f := j;
                        End;
                      j := j+1;
                    End;
                  i := i+1;
                End;
              j := w ;
              i := v;
            End;
          j := j+1;
        End;
      i := i+1;
    End;
  i := e;
  j := f;
End;

Procedure rangcasesepar(m:tmat;Var i:tindl; Var j:tindc; t:Longint; Var q:Boolean);
Var
  ee,ii: tindl;
  ff,jj: tindc;
Begin
  i := 1;
  q := False;
  While (i<4) And Not q Do
    Begin
      j := 1;
      While (j<4) And Not q Do
        Begin
          ii := i;
          jj := j;
          If m[i,j]=t Then
            Begin
              i := 1;
              While (i<4) And Not q Do
                Begin
                  j := 1;
                  While (j<4) And Not q Do
                    Begin
                      If (m[i,j]=t) And (((Abs(i-ii)=2) And (j=jj)) Xor ( (i=ii) And (Abs(j-jj)=2)))
                        Then
                        Begin
                          If i=ii Then
                            Begin
                              q := True;
                              ee := i;
                              ff := 2;
                            End
                          Else
                            Begin
                              If j=jj Then
                                Begin
                                  q := True;
                                  ee := 2;
                                  ff := j;
                                End;
                            End;
                        End;
                      j := j+1;
                    End;
                  i := i+1;
                End;
            End;
          i := ii;
          j := jj;
          j := j+1;
        End;
      i := i+1;
    End;
  i := ee;
  j := ff;
End;
Begin
  Repeat
    For i:=1 To 3 Do
      Begin
        For j:=1 To 3 Do
          Begin
            m[i,j] := 0;
          End;
      End;
    Repeat
      Clrscr;
      Writeln;
      Writeln(

  '                                                                    X/O Cree Par Mohammed Touami'
      );
      Writeln;
      Writeln;
      Writeln('                                                                    Facile: 1');
      Writeln('                                                                    Difficile: 2');
      Write(

 '                                                                    Choisissez Votre Difficulte: '
      );
      Readln(a);
    Until (a=1) Or (a=2);
    Repeat
      Clrscr;
      Writeln;
      Writeln;
      Writeln;
      Writeln;
      Writeln(

        '                                                                    La Machine Commence: 1'
      );
      Writeln('                                                                    Je Commence: 2');
      Write('                                                                    Choisissez: ');
      Readln(b);
    Until (b=1) Or (b=2);
    loading;
    If (a=2) And (b=2) Then
      Begin
        Clrscr;
        ecriremat(m);
        tourjoueur(i,j,m);
        m[i,j] := 2;
        Clrscr;
        ecriremat(m);
        loading;
        If m[2,2]=0 Then m[2,2] := 1
        Else
          Begin
            Repeat
              Randomize;
              i := Random(3)+1;
              Writeln(i);
              j := Random(3)+1;
              Writeln(j);
            Until ((i=3) Or (i=1)) And ((j=3) Or (j=1));
            m[i,j] := 1;
          End;
        Clrscr;
        ecriremat(m);
        Repeat
          tourjoueur(i,j,m);
          If m[i,j]<>0 Then
            Begin
              Clrscr;
              ecriremat(m);
              Writeln(

 '                                                 Cette Case Est Deja Occupee, Reessayer Une Autre'
              );
            End;
        Until m[i,j]=0;
        m[i,j] := 2;
        Clrscr;
        ecriremat(m);
        loading;
        If (m[2,2]=2) Then
          Begin
            rangcase(m,i,j,2,q);
            If q And (m[i,j]=0) Then
              Begin
                m[i,j] := 1
              End
            Else
              Begin
                Repeat
                  Randomize;
                  i := Random(3)+1;
                  j := Random(3)+1;
                Until ((i=3) Or (i=1)) And ((j=3) Or (j=1)) And (m[i,j]=0);
                m[i,j] := 1;
              End;
          End
        Else
          Begin
            rangcase(m,i,j,2,q);
            If q Then m[i,j] := 1
            Else
              Begin
                rangcasesepar(m,i,j,2,q);
                If q Then m[i,j] := 1
                Else
                  Begin
                    Repeat
                      Randomize;
                      i := Random(3)+1;
                      j := Random(3)+1;
                    Until (((i=2) And ((j=1) Or (j=3))) Or ((j=2) And ((i=1) Or (i=3)))) And (m[i,j]
                          =0
                          );
                    m[i,j] := 1;
                  End;
              End;
          End;
        Clrscr;
        ecriremat(m);
        Repeat
          tourjoueur(i,j,m);
          If m[i,j]<>0 Then
            Begin
              Clrscr;
              ecriremat(m);
              Writeln(

 '                                                 Cette Case Est Deja Occupee, Reessayer Une Autre'
              );
            End;
        Until m[i,j]=0;
        m[i,j] := 2;
        If gameover(m) Then
          Begin
            Writeln;
            Writeln;
            Writeln;
            Writeln;
            Write(

                 '                                                               Vous Avez Gagne!!!'
            );
          End
        Else
          Begin
            Clrscr;
            ecriremat(m);
            loading;
            rangcase(m,i,j,1,q);
            If q And (m[i,j]=0) Then m[i,j] := 1
            Else
              Begin
                rangcasesepar(m,i,j,1,q);
                If q And (m[i,j]=0) Then m[i,j] := 1
                Else
                  Begin
                    rangcase(m,i,j,2,q);
                    If q And (m[i,j]=0) Then m[i,j] := 1
                    Else
                      Begin
                        rangcasesepar(m,i,j,2,q);
                        If q And (m[i,j]=0) Then m[i,j] := 1
                        Else
                          Begin
                            Repeat
                              Randomize;
                              i := Random(3)+1;
                              j := Random(3)+1;
                            Until m[i,j]=0;
                            writeln('random');
                            readln;
                            m[i,j] := 1;
                          End;
                      End;
                  End;
              End;
            If gameover(m) Then
              Begin
                Clrscr;
                ecriremat(m);
                Writeln;
                Writeln;
                Writeln;
                Writeln;
                Write(

          '                                                                  La Machine A Ganger!!!'
                );
              End
            Else
              Begin
                Clrscr;
                ecriremat(m);
                Repeat
                  tourjoueur(i,j,m);
                  If m[i,j]<>0 Then
                    Begin
                      Clrscr;
                      ecriremat(m);
                      Writeln('Cette Case Est Deja Occupee, Reessayer Une Autre');
                    End;
                Until m[i,j]=0;
                m[i,j] := 2;
                If gameover(m) Then
                  Begin
                    Clrscr;
                    ecriremat(m);
                    Writeln;
                    Writeln;
                    Writeln;
                    Writeln;
                    Write(

                '                                                                Vous Avez Gagne!!!'
                    ) ;
                  End
                Else
                  Begin
                    Clrscr;
                    ecriremat(m);
                    loading;
                    rangcase(m,i,j,1,q);
                    If q And (m[i,j]=0) Then m[i,j] := 1
                    Else
                      Begin
                        rangcasesepar(m,i,j,1,q);
                        If q And (m[i,j]=0) Then m[i,j] := 1
                        Else
                          Begin
                            rangcase(m,i,j,2,q);
                            If q And (m[i,j]=0) Then m[i,j] := 1
                            Else
                              Begin
                                rangcasesepar(m,i,j,2,q);
                                If q And (m[i,j]=0) Then
                                begin
                                m[i,j] := 1
                                end
                                Else
                                  Begin
                                    Repeat
                                      Randomize;
                                      i := Random(3)+1;
                                      j := Random(3)+1;
                                    Until m[i,j]=0;

                                    m[i,j] := 1;
                                  End;
                              End;
                          End;
                      End;
                    If gameover(m) Then
                      Begin
                        Clrscr;
                        ecriremat(m);
                        Writeln;
                        Writeln;
                        Writeln;
                        Writeln;
                        Write(

        '                                                                    La Machine A Ganger!!!'
                        );
                      End
                    Else
                      Begin
                        Clrscr;
                        ecriremat(m);
                        Repeat
                          tourjoueur(i,j,m);
                          If m[i,j]<>0 Then
                            Begin
                              Clrscr;
                              ecriremat(m);
                              Writeln(

 '                                                 Cette Case Est Deja Occupee, Reessayer Une Autre'
                              );
                            End;
                        Until m[i,j]=0;
                        m[i,j] := 2;
                        Writeln;
                        Writeln;
                        Writeln;
                        If gameover(m) Then
                          Begin
                            Clrscr;
                            ecriremat(m);
                            Writeln;
                            Writeln;
                            Writeln;
                            Writeln;
                            Write(

                 '                                                               Vous Avez Gagne!!!'
                            );
                          End
                        Else Writeln(

                      '                                                                        Nul!'
                          );
                      End;
                  End;
              End;
          End;
        Writeln;
        Writeln;
        Writeln;
        Write(

'                                                     Appuyez Sur ENTREE Pour Rejouer, ou Sur ESC Pour Quitter'
        );
      End
    Else
      Begin
        If (a=2) And (b=1) Then
          Begin
            Clrscr;
            ecriremat(m);
            loading;
            m[2,2] := 1;
            Clrscr;
            ecriremat(m);
            Repeat
              tourjoueur(i,j,m);
              If m[i,j]<>0 Then
                Begin
                  Clrscr;
                  ecriremat(m);
                  Writeln(

 '                                                 Cette Case Est Deja Occupee, Reessayer Une Autre'
                  );
                End;
            Until m[i,j]=0;
            m[i,j] := 2;
            Clrscr;
            ecriremat(m);
            loading;
            If (m[2,2]=2) Then
              Begin
                rangcase(m,i,j,2,q);
                If q And (m[i,j]=0) Then
                  Begin
                    m[i,j] := 1
                  End
                Else
                  Begin
                    Repeat
                      Randomize;
                      i := Random(3)+1;
                      j := Random(3)+1;
                    Until ((i=3) Or (i=1)) And ((j=3) Or (j=1)) And (m[i,j]=0);
                    m[i,j] := 1;
                  End;
              End
            Else
              Begin
                rangcase(m,i,j,2,q);
                If q Then m[i,j] := 1
                Else
                  Begin
                    rangcasesepar(m,i,j,2,q);
                    If q Then m[i,j] := 1
                    Else
                      Begin
                        Repeat
                          Randomize;
                          i := Random(3)+1;
                          j := Random(3)+1;
                        Until (((i=2) And ((j=1) Or (j=3))) Or ((j=2) And ((i=1) Or (i=3)))) And (m[
                              i,
                              j]=0);
                        m[i,j] := 1;
                      End;
                  End;
              End;
            Clrscr;
            ecriremat(m);
            Repeat
              tourjoueur(i,j,m);
              If m[i,j]<>0 Then
                Begin
                  Clrscr;
                  ecriremat(m);
                  Writeln(

 '                                                 Cette Case Est Deja Occupee, Reessayer Une Autre'
                  );
                End;
            Until m[i,j]=0;
            m[i,j] := 2;
            If gameover(m) Then
              Begin
                Clrscr;
                ecriremat(m);
                Writeln;
                Writeln;
                Writeln;
                Writeln;
                Write(

                 '                                                               Vous Avez Gagne!!!'
                );
              End
            Else
              Begin
                Clrscr;
                ecriremat(m);
                loading;
                rangcase(m,i,j,1,q);
                If q And (m[i,j]=0) Then m[i,j] := 1
                Else
                  Begin
                    rangcasesepar(m,i,j,1,q);
                    If q And (m[i,j]=0) Then m[i,j] := 1
                    Else
                      Begin
                        rangcase(m,i,j,2,q);
                        If q And (m[i,j]=0) Then m[i,j] := 1
                        Else
                          Begin
                            rangcasesepar(m,i,j,2,q);
                            If q And (m[i,j]=0) Then m[i,j] := 1
                            Else
                              Begin
                                Repeat
                                  Randomize;
                                  i := Random(3)+1;
                                  j := Random(3)+1;
                                Until m[i,j]=0;
                                m[i,j] := 1;
                              End;
                          End;
                      End;
                  End;
                If gameover(m) Then
                  Begin
                    Clrscr;
                    ecriremat(m);
                    Writeln;
                    Writeln;
                    Writeln;
                    Writeln;
                    Write(

          '                                                                  La Machine A Ganger!!!'
                    );
                  End
                Else
                  Begin
                    Clrscr;
                    ecriremat(m);
                    Repeat
                      tourjoueur(i,j,m);
                      If m[i,j]<>0 Then
                        Begin
                          Clrscr;
                          ecriremat(m);
                          Writeln(

 '                                                 Cette Case Est Deja Occupee, Reessayer Une Autre'
                          );
                        End;
                    Until m[i,j]=0;
                    m[i,j] := 2;
                    If gameover(m) Then
                      Begin
                        ecriremat(m);
                        Writeln;
                        Writeln;
                        Writeln;
                        Writeln;
                        Write(

                '                                                                Vous Avez Gagne!!!'
                        ) ;
                      End
                    Else
                      Begin
                        Clrscr;
                        ecriremat(m);
                        loading;
                        rangcase(m,i,j,1,q);
                        If q And (m[i,j]=0) Then m[i,j] := 1
                        Else
                          Begin
                            rangcasesepar(m,i,j,1,q);
                            If q And (m[i,j]=0) Then m[i,j] := 1
                            Else
                              Begin
                                rangcase(m,i,j,2,q);
                                If q And (m[i,j]=0) Then m[i,j] := 1
                                Else
                                  Begin
                                    rangcasesepar(m,i,j,2,q);
                                    If q And (m[i,j]=0) Then m[i,j] := 1
                                    Else
                                      Begin
                                        Repeat
                                          Randomize;
                                          i := Random(3)+1;
                                          j := Random(3)+1;
                                        Until m[i,j]=0;
                                        m[i,j] := 1;
                                      End;
                                  End;
                              End;
                          End;
                        If gameover(m) Then
                          Begin
                            Clrscr;
                            ecriremat(m);
                            Writeln;
                            Writeln;
                            Writeln;
                            Writeln;
                            Write(

        '                                                                    La Machine A Ganger!!!'
                            );
                          End
                        Else
                          Begin
                            Clrscr;
                            ecriremat(m);
                            Repeat
                              tourjoueur(i,j,m);
                              If m[i,j]<>0 Then
                                Begin
                                  Clrscr;
                                  ecriremat(m);
                                  Writeln(

 '                                                 Cette Case Est Deja Occupee, Reessayer Une Autre'
                                  );
                                End;
                            Until m[i,j]=0;
                            m[i,j] := 2;
                            Writeln;
                            Writeln;
                            Writeln;
                            If gameover(m) Then
                              Begin
                                ecriremat(m);
                                Writeln;
                                Writeln;
                                Writeln;
                                Writeln;
                                Write(

                 '                                                               Vous Avez Gagne!!!'
                                );
                              End
                            Else
                              Begin
                                Clrscr;
                                ecriremat(m);
                                loading;
                                rangcase(m,i,j,1,q);
                                If q And (m[i,j]=0) Then m[i,j] := 1
                                Else
                                  Begin
                                    rangcasesepar(m,i,j,1,q);
                                    If q And (m[i,j]=0) Then m[i,j] := 1
                                    Else
                                      Begin
                                        rangcase(m,i,j,2,q);
                                        If q And (m[i,j]=0) Then m[i,j] := 1
                                        Else
                                          Begin
                                            rangcasesepar(m,i,j,2,q);
                                            If q And (m[i,j]=0) Then m[i,j] := 1
                                            Else
                                              Begin
                                                Repeat
                                                  Randomize;
                                                  i := Random(3)+1;
                                                  j := Random(3)+1;
                                                Until m[i,j]=0;
                                                m[i,j] := 1;
                                              End;
                                          End;
                                      End;
                                  End;
                                If gameover(m) Then
                                  Begin
                                    Clrscr;
                                    loading;
                                    ecriremat(m);
                                    Writeln;
                                    Writeln;
                                    Writeln;
                                    Writeln;
                                    Write(

        '                                                                    La Machine A Ganger!!!'
                                    );
                                  End
                                Else
                                  Begin
                                    loading;
                                    Clrscr;
                                    ecriremat(m);
                                    Writeln(

                     '                                                                         Nul!'
                                    );
                                  End;
                              End;
                          End;
                      End;
                  End;
              End;
            Writeln;
            Writeln;
            Writeln;
            Write(

'                                                     Appuyez Sur ENTREE Pour Rejouer, ou Sur ESC Pour Quitter'
            );
          End
        Else
          Begin
            If (a=1) And (b=1) Then
              Begin
                Repeat
                  Clrscr;
                  ecriremat(m);
                  q := True;
                  For i:=1 To 3 Do
                    Begin
                      For j:=1 To 3 Do
                        Begin
                          If m[i,j]=0 Then q := False;
                        End;
                    End;
                  If Not q Then
                    Begin
                      loading;
                      Clrscr;
                      Repeat
                        Randomize;
                        i := Random(3)+1;
                        j := Random(3)+1;
                      Until m[i,j]=0;
                      m[i,j] := 1;
                      ecriremat(m);
                      If gameover(m) Then Writeln(

                                   '                                            La  Machine A Gange'
                        );
                      q := True;
                      For i:=1 To 3 Do
                        Begin
                          For j:=1 To 3 Do
                            Begin
                              If m[i,j]=0 Then q := False;
                            End;
                        End;
                      If Not q And Not gameover(m) Then
                        Begin
                          Repeat
                            tourjoueur(i,j,m);
                            If m[i,j]<>0 Then
                              Begin
                                Clrscr;
                                ecriremat(m);
                                Writeln(

 '                                                 Cette Case Est Deja Occupee, Reessayer Une Autre'
                                );
                              End;
                          Until m[i,j]=0;
                          m[i,j] := 2;
                          Clrscr;
                          ecriremat(m);
                        End;
                      If gameover(m) Then Writeln (

                      '                                                            Vous Avez Gange!'
                        );
                    End;
                Until q Or gameover(m);
                If Not gameover(m) Then
                  Begin
                    Clrscr;
                    ecriremat(m);
                    Writeln;
                    Write(

                  '                                                                             nul'
                    );
                  End;
                Write(

'                                                     Appuyez Sur ENTREE Pour Rejouer, ou Sur ESC Pour Quitter'
                );
              End
            Else
              Begin
                Repeat
                  Clrscr;
                  ecriremat(m);
                  q := True;
                  For i:=1 To 3 Do
                    Begin
                      For j:=1 To 3 Do
                        Begin
                          If m[i,j]=0 Then q := False;
                        End;
                    End;
                  If Not q Then
                    Begin
                      Repeat
                        tourjoueur(i,j,m);
                        If m[i,j]<>0 Then
                          Begin
                            Clrscr;
                            ecriremat(m);
                            Writeln(

 '                                                 Cette Case Est Deja Occupee, Reessayer Une Autre'
                            );
                          End;
                      Until m[i,j]=0;
                      m[i,j] := 2;
                      q := True;
                      For i:=1 To 3 Do
                        Begin
                          For j:=1 To 3 Do
                            Begin
                              If m[i,j]=0 Then q := False;
                            End;
                        End;
                      If Not q And Not gameover(m) Then
                        Begin
                          loading;
                          Clrscr;
                          Repeat
                            Randomize;
                            i := Random(3)+1;
                            j := Random(3)+1;
                          Until m[i,j]=0;
                          m[i,j] := 1;
                          ecriremat(m);
                          If gameover(m) Then Writeln(

                          '                                                     La  Machine A Gange'
                            );
                          Clrscr;
                          ecriremat(m);
                        End;
                      If gameover(m) Then Writeln (

                       '                                                           Vous Avez Gange!'
                        );
                    End;
                Until q Or gameover(m);
                If Not gameover(m) Then
                  Begin
                    Clrscr;
                    ecriremat(m);
                    Writeln;
                    Write(

                  '                                                                             nul'
                    );
                  End;
                Write(

'                                                     Appuyez Sur ENTREE Pour Rejouer, ou Sur ESC Pour Quitter'
                );
              End;
          End;
      End;
  Until Readkey=Chr(27);
End.
