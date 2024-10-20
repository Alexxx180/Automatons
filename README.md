# Automatons

Separate script modules to automate daily routines

## Setup

To install modules for your system do:

1. Init the repo in the directory containing modules folder

```shell
git init
```

2. Add remote origin

```shell
git remote add -f origin 'https://github.com/Alexxx180/Automatons'
```

3. Allow sparse checkout

```shell
git config core.sparseCheckout true
```

4. Add directory to check out, example for powershell only

```shell
echo "powershell" >> .git/info/sparse-checkout
```

5. Update the empty repo

```shell
git pull origin main
```
