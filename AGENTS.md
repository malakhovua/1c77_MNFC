# AGENTS.md

## Purpose
This file gives AI coding agents the minimal context needed to work productively in this repository.

## Repository type
- This is a 1C:Enterprise 7.7 configuration repository.
- The source is stored as decompiled text under `conf/` and must be compiled back to binary via `compile.bat`.

## Primary workflow
- Edit objects in `conf/`.
- Use `compile.bat` to generate `MD_compile/1Cv7.MD` from `conf/`.
- Use `pull_compile.bat` to update from git and recompile.
- Use `compile_decompile_git_script.bat` only when working with the live 1C database and round-tripping changes.

## Important conventions
- All 1C source files in `conf/` use Windows-1251 encoding and CRLF line endings.
- Variable names, procedure names, and comments in code are Russian/Cyrillic only.
- Do not mix Latin letters into 1C identifiers (for example, use `ƒатаƒок`, not `ƒатаDok`).
- Preserve existing 1C structure and naming conventions for documents, catalogs, registers, reports, and forms.

## Key directories
- `conf/` Ч main decompiled 1C configuration.
- `conf/√лобальныйћодуль.1s` Ч global module, changes affect the entire configuration.
- `conf/ƒокументы/`, `conf/—правочники/`, `conf/–егистры/`, `conf/ќтчеты/`, `conf/ќбработки/` Ч main object types.
- `conf/gcomp.ini` Ч gcomp settings with `language: Rus`.

## Behavior for this repository
- Prefer using the existing `CLAUDE.md` for deeper repository-specific rules.
- Do not create new configuration object directories unless the task explicitly requires it.
- When asked to modify code, keep changes localized and consistent with 1C conventions.
- If a task involves 1C files, mention the Windows-1251 / CRLF requirement.

## Notes for AI agents
- This repository is not a typical web or backend project; it is a metadata-based ERP configuration.
- Avoid proposing standard JavaScript/TypeScript/node project conventions unless the task explicitly targets supporting tooling.
- Use the root `CLAUDE.md` as the authoritative source for repository and 1C-specific workflow details.
