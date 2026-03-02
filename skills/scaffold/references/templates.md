# Project Templates

Starter configurations for each supported project type.

## Frontend Projects

### `react-app`
- **Stack**: React 18 + TypeScript + Vite + Tailwind CSS
- **Structure**: `src/components/`, `src/hooks/`, `src/pages/`, `src/utils/`, `src/types/`
- **Config**: ESLint, Prettier, tsconfig strict, Vitest
- **Agent**: `react-specialist` → `typescript-pro`

### `next-app`
- **Stack**: Next.js 14+ (App Router) + TypeScript + Tailwind CSS
- **Structure**: `app/`, `components/`, `lib/`, `types/`, `public/`
- **Config**: ESLint (next), Prettier, tsconfig strict
- **Agent**: `nextjs-developer` → `typescript-pro`

### `vue-app`
- **Stack**: Vue 3 + TypeScript + Vite + Pinia
- **Structure**: `src/components/`, `src/composables/`, `src/stores/`, `src/views/`
- **Config**: ESLint (vue), Prettier, tsconfig
- **Agent**: `vue-expert` → `typescript-pro`

### `angular-app`
- **Stack**: Angular 17+ + TypeScript
- **Structure**: Standard Angular CLI layout
- **Config**: Angular ESLint, Karma/Jasmine
- **Agent**: `angular-architect` → `typescript-pro`

## Backend Projects

### `python-api`
- **Stack**: FastAPI + Pydantic + SQLAlchemy + Alembic
- **Structure**: `app/api/`, `app/models/`, `app/schemas/`, `app/services/`, `tests/`
- **Config**: pyproject.toml, ruff, mypy, pytest
- **Agent**: `python-pro`

### `django-app`
- **Stack**: Django 5+ + Django REST Framework
- **Structure**: Standard Django project layout
- **Config**: pyproject.toml, ruff, mypy, pytest-django
- **Agent**: `django-developer` → `python-pro`

### `node-api`
- **Stack**: Express/Fastify + TypeScript + Prisma
- **Structure**: `src/routes/`, `src/controllers/`, `src/services/`, `src/models/`, `tests/`
- **Config**: ESLint, Prettier, tsconfig, Vitest
- **Agent**: `typescript-pro`

### `graphql-api`
- **Stack**: GraphQL (Apollo/Yoga) + TypeScript + Prisma
- **Structure**: `src/schema/`, `src/resolvers/`, `src/services/`, `src/models/`
- **Config**: ESLint, Prettier, codegen
- **Agent**: `graphql-architect` → `typescript-pro`

## Systems Projects

### `rust-cli`
- **Stack**: Rust + clap + serde + tokio
- **Structure**: `src/`, `tests/`, standard Cargo layout
- **Config**: Cargo.toml, clippy, rustfmt
- **Agent**: `rust-engineer`

### `rust-api`
- **Stack**: Rust + Actix-web/Axum + SQLx + serde
- **Structure**: `src/handlers/`, `src/models/`, `src/services/`, `src/routes/`
- **Config**: Cargo.toml, clippy, rustfmt
- **Agent**: `rust-engineer`

### `go-api`
- **Stack**: Go + Chi/Gin + GORM
- **Structure**: `cmd/`, `internal/`, `pkg/`, standard Go layout
- **Config**: go.mod, golangci-lint
- **Agent**: `golang-pro`

### `go-cli`
- **Stack**: Go + cobra + viper
- **Structure**: `cmd/`, `internal/`, standard Go layout
- **Config**: go.mod, golangci-lint
- **Agent**: `golang-pro`

## Fullstack Projects

### `next-fullstack`
- **Stack**: Next.js + TypeScript + Prisma + Tailwind + NextAuth
- **Structure**: App Router + API routes + Prisma schema
- **Config**: ESLint (next), Prettier, Prisma
- **Agent**: `nextjs-developer` → `typescript-pro`

### `t3-app`
- **Stack**: T3 Stack (Next.js + tRPC + Prisma + Tailwind + NextAuth)
- **Structure**: Standard T3 layout
- **Config**: T3 defaults
- **Agent**: `nextjs-developer` → `typescript-pro`

## Infrastructure Projects

### `docker-compose`
- **Stack**: Docker Compose + Dockerfile(s)
- **Structure**: Service directories + docker-compose.yml
- **Agent**: `docker-expert`

### `terraform-infra`
- **Stack**: Terraform + provider modules
- **Structure**: `modules/`, `environments/`, standard Terraform layout
- **Agent**: `terraform-engineer`

## Mobile Projects

### `flutter-app`
- **Stack**: Flutter + Dart
- **Structure**: Standard Flutter layout
- **Agent**: `flutter-expert`

### `react-native-app`
- **Stack**: React Native + TypeScript + Expo
- **Structure**: Standard Expo layout
- **Agent**: `react-specialist` → `typescript-pro`
