# Hasura
I am just checking hasura here.

# Sample queries:
```graphql
query EmployeesRelational {
  employees {
    first_name
    last_name
    employees_roles {
      role {
        title
      }
      started_on
    }
  }
}

```
```graphql
query EmployesFromJson {
  employees_json_by_pk(id: "1") {
    id,
    name: data(path: "$.first_name"),
    roles: data(path: "$.roles")
  }
}
```
```graphql
query EmployesFromJsonFiltered {
  employees_json(where: {data: {_contains: {first_name: "Marcin"}}}) {
    id
    name: data(path: "$.first_name")
    roles: data(path: "$.roles")
  }
}
```
