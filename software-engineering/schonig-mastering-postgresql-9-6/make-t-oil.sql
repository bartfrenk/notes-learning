
CREATE TABLE t_oil (
       region text,
       country text,
       year int,
       production int,
       consumption int
       );

COPY t_oil FROM PROGRAM ' curl www.cybertec.at/secret/oil_ext.txt ';
