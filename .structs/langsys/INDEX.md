# Language and Domain-Knowledge Standards Index

<a id="toc"></a>
## Table of Contents

- [Purpose](#purpose)
- [Catalog](#catalog)
- [Routing Notes](#routing-notes)

<a id="purpose"></a>
## Purpose

`langsys` contains standards for programming languages, shell scripting, SQL/stored procedures, CI scripting, Slurm jobs, RAG processing, search/API use, HTTP token/header handling, Unix text tools, markup, diagrams, validation, return codes, and exception handling.

<a id="catalog"></a>
## Catalog

| File                                                   | Purpose                                                   |
| ------------------------------------------------------ | --------------------------------------------------------- |
| `.structs/langsys/posix-shell/STANDARD.md`             | POSIX Shell and Legacy Shell Agent Standard               |
| `.structs/langsys/bash/STANDARD.md`                    | Bash Shell >=5.x Agent Standard                           |
| `.structs/langsys/lisp-lua/STANDARD.md`                | Lisp and Lua Agent Standard                               |
| `.structs/langsys/sql/ansi-sql.md`                     | ANSI/ISO SQL Standard Profile                             |
| `.structs/langsys/sql/mysql-percona.md`                | MySQL and Percona SQL / Stored Procedure Standard         |
| `.structs/langsys/sql/oracle-rac.md`                   | Oracle Database and RAC SQL / Extension Standard          |
| `.structs/langsys/sql/postgres.md`                     | PostgreSQL SQL / Extension Standard                       |
| `.structs/langsys/groovy-jenkins/STANDARD.md`          | Groovy / Jenkins Scripting Standard                       |
| `.structs/langsys/slurm/STANDARD.md`                   | SLURM Scripting Standard                                  |
| `.structs/langsys/rag-data-processing/STANDARD.md`     | RAG Data Processing Standard                              |
| `.structs/langsys/search-engine-apis/STANDARD.md`      | Search Engine API Standard                                |
| `.structs/langsys/http-api-token-headers/STANDARD.md`  | HTTPS API Token and Header Set Standard                   |
| `.structs/langsys/unix-text-tools/STANDARD.md`         | curl, wget, awk, and sed Scripting Standard               |
| `.structs/langsys/markup/STANDARD.md`                  | Markup Handling Standard                                  |
| `.structs/langsys/diagrams/STANDARD.md`                | PlantUML and Mermaid Diagram Standard                     |
| `.structs/langsys/validation/STANDARD.md`              | Validation Handling Standard                              |
| `.structs/langsys/return-codes-exceptions/STANDARD.md` | POSIX Return Codes and General Exception Handler Standard |

<a id="routing-notes"></a>
## Routing Notes

- Use the most specific language file first, then apply `return-codes-exceptions` and `validation` when the output is executable.
- For database changes, read `sql/ansi-sql.md` plus the target database standard.
- For RAG/search/API work, read `rag-data-processing`, `search-engine-apis`, and `http-api-token-headers` together.
- For docs, read `markup` and `diagrams` together when rendered visual artifacts are included.
