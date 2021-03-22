FROM ibmcom/db2

COPY Loans.sql /var/custom/Loans.sql
COPY import_db2.sh /var/custom/import_db2.sh
RUN chmod a+x /var/custom/import_db2.sh
EXPOSE 50000