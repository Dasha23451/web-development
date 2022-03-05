PROGRAM HelloDear(INPUT, OUTPUT);
USES
  DOS;
FUNCTION GetQueryStringParameter(Key: STRING): STRING;
VAR
  Query, Value, a: STRING;
  KeyPos, I: INTEGER;
BEGIN
  Value := '';
  Query := GetEnv('QUERY_STRING');
  KeyPos := POS(Key, Query) + Length(Key) + 1;
  a := COPY(Query, KeyPos + 1, 1);
  IF (Query  <> '') AND (a <> '')
  THEN
    BEGIN
      WRITE('Hello dear, ');
      FOR I := KeyPos TO Length(Query)
      DO
        BEGIN
          IF (Query[I] = '&')
          THEN
            BREAK;
          Value := Value + Query[I];
        END
    END
  ELSE
    WRITELN('Hello Anonymous!');
  GetQueryStringParameter := Value
END;
VAR
  Query, b, Name: STRING;
  I, a: INTEGER;
BEGIN
  WRITELN('Content-Type: text/plain');
  WRITELN;
  WRITELN(GetQueryStringParameter('name'))
END.
