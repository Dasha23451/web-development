PROGRAM HelloDear(INPUT, OUTPUT);
USES
  DOS;
   
FUNCTION GetQueryStringParameter(Key: STRING): STRING;
VAR
  Query, Value: STRING;
  KeyPos, I: INTEGER;
BEGIN
  Value := '';
  Query := GetEnv('QUERY_STRING');
  KeyPos := POS(Key, Query) + Length(Key) + 1;
  FOR I := KeyPos TO Length(Query)
  DO
    BEGIN
      IF (Query[I] = '&')
      THEN
        BREAK;
      Value := Value + Query[I];
    END;
  GetQueryStringParameter := Value
VAR
  Query, Name: STRING;
  I: INTEGER;
BEGIN 
  WRITELN('Content-Type: text/plain');
  WRITELN;
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
END. 
