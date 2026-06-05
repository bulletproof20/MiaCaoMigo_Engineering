docker run --rm `
  --network 01_miacaomigo_datalayer_default `
  -v "${PSScriptRoot}/../02_Output:/output" `
  schemaspy/schemaspy:latest `
  -t pgsql `
  -host db `
  -port 5432 `
  -db miacaomigo `
  -u postgres `
  -p 1234 `
  -s public