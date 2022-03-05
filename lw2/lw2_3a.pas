PROGRAM HelloDear(INPUT, OUTPUT);
USES
  DOS; 
VAR
  Query, b, Name: STRING;
  I, a: INTEGER;
BEGIN
  WRITELN('Content-Type: text/plain');
  WRITELN;
  Query := GetEnv('QUERY_STRING');
  a := POS('=', Query);
  b := COPY(Query, a+1, 1);
  IF (b > '')
  THEN
    BEGIN
      WRITE('Hello dear, ');
      FOR I := POS('=', Query) + 1 TO Length(Query)
      DO
        BEGIN
          Name := Query[I];
          WRITE(Name)
        END;
      WRITELN
    END
  ELSE
    WRITELN('Hello Anonymous!')
END.
