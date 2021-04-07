#!/bin/bash

echo "Starting DB import..."
su - db2inst1 -c "db2 -tvmf /var/custom/Loans.sql"
echo "Initialize complete"
