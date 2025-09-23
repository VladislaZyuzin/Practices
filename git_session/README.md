# Практическое задание по работе с гитом

> Практическая сессия работы с Git (Git command line: fetch, push, pull, rebase, checkout, submodules).

## Разберём задачи: 

### Задание 1: Настройка и базовые операции
**Интервьюер**: "Давайте начнем с создания нового репозитория и базовых операций. Покажите мне:

```bash
# Создание нового репозитория 
git init git-practice-session

# Перейдём в репу
cd git-practice-session

# Создадим простенькие файлы: 
echo "# Git Practice Project" > README.mdн
echo "console.log('Hello Git');" > main.js
echo "body { color: blue; }" > styles.css
echo "print("vladick")" > 123.py

# Добавим файлы в staging area (тестовую зону)
git add . # (знак "точка" - добавить все файлы, если нужно по отдельности, то через пробел указываем имена файлов)

# Коммитим изменения
git commit -m "Создан репозиторий, добавлены файлы"

# Проверка статуса и истории
git status # Показывает, на какой ветке находимся и наличие незакоммиченных изменений
git log --oneline # показывает все истории коммитов
```

Так как последнее - наиболее интерестно, то вот как это выглядит на практике: 

<img width="1083" height="461" alt="Снимок экрана от 2025-09-23 12-12-19" src="https://github.com/user-attachments/assets/38310746-4c26-4fe7-83ad-18512032a389" />

#### Проверка понимания:

"Объясните разницу между git add . и git add -A?"
> `git add .` добавляет только файлы в текущей папке в стейдж зону, а `git add -A` добавляет файлы из всех папок в репозитории
"Что делает команда git status?"
> Она показывает в какой ветке вы находитесь, а так же, показывает незакоммиченные изменения

### Задание 2: Работа с ветками и checkout

```bash
# 1. Создайте и переключитесь на новую ветку
git checkout -b feature/user-authentication

# 2. Внесите изменения в новой ветке
echo "// User auth module" > auth.js
echo "function login() {}" >> auth.js

# 3. Добавьте и закоммитьте изменения
git add auth.js
git commit -m "Add user authentication skeleton"

# 4. Вернитесь на main ветку
git checkout main

# 5. Создайте еще одну ветку для исправлений
git checkout -b hotfix/readme-update
echo "## Installation guide" >> README.md
git add README.md
git commit -m "Update README with installation instructions"
```
#### Проверка понимания:

"Чем отличается git checkout -b от git branch + git checkout?"

> `git checkout -b` создаёт и сразу переходит на новую ветку, `git branch` показывает все ветки в репозитории, `git checkout` позволяет переключаться по веткам

"Как посмотреть все ветки в репозитории?"

>  Воспользуемся командой `git branch`

<img width="966" height="641" alt="image" src="https://github.com/user-attachments/assets/56c40048-a6f8-46e5-8b7b-fe698587b186" />

### Задание 3: Fetch, Pull и работа с удаленным репозиторием

Представим ситуацию, что у нас готов проект на стейдж ветке, у нас это: `feature/user-authentication`. После код ревью и тестирования стедж ветки на стейдж окруженнии нам дали задание - перенести изменения в main. Для этого нужно сделать следующее: 
```bash
# Я добавил файл:
nano apple.md

# После того, как файл прошёл проверку на стейдже - подготовим всё к переносу
# Сначала - убедимся, что мы на целевой ветке
git checkout main

# Теперь получим последние изменения с удалённой репы (просто узнаем)
git ferch origin

# Обновим main до последней версии, если коммиты отстают
git pull origin main

# После - переключаемся на исходную ветку
git checkout feature/user-authentication

# Обновляем feature ветку
git rebase main

# Проверяем статус
git status

# Посмотрим историю изменений
git log --oneline

# Проверим, что ветка готова к мержу
git diff main..feature/user-authentication

# Переключаемся на main
git checkout main

# Делаем merge с созданием merge-коммита
git merge --no-ff feature/user-authentication
```

Если возникает конфликт на каком то из действий, то:
```bash
git status

# смотрим, где конфликт исправляем файл, из-за которого был кофликт

# Добавляем исправленный файл в локальную репу
git add <название исправленного файла>

# Коммитим изменения
git commit -m "Исправлен конфликт в файле ..." 
```

