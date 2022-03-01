PROGRAM WorkWithQueryString(INPUT, OUTPUT);
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
END;
BEGIN {WorkWithQueryString}
  WRITELN('Content-Type: text/plain');
  WRITELN;
  WRITELN('First Name: ', GetQueryStringParameter('first_name'));
  WRITELN('Last Name: ', GetQueryStringParameter('last_name'));
  WRITELN('Age: ', GetQueryStringParameter('age'))
END. {WorkWithQueryString}
