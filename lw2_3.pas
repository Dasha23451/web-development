PROGRAM HelloDear(INPUT, OUTPUT);
USES
  DOS;
VAR
  Query, Name: STRING;
  I: INTEGER;
BEGIN {PaulRevere}
  WRITELN('Content-Type: text/plain');
  WRITELN;
  Query := GetEnv('QUERY_STRING');
  IF (Length(Query) > 0)
  THEN
    BEGIN
      FOR I := POS('=', Query) + 1 TO Length(Query)
      DO
        Name := Query[I];
      WRITELN('Hello Dear, ', Name)
    END
  ELSE
    WRITELN('Hello Anonymous!')
END. {PaulRevere}
