# ReScript-shakyo1

[Setting Up A Rescript Create-React-App From Scratch](https://dusty.phillips.codes/2021/01/28/setting-up-a-rescript-create-react-app-from-scratch/)

2021-01-28

## 1.

```
$ echo '{"private":true}' | jq '.' > package.json
$ npm install bs-platform
```

## 2.

- Don't use ReasonReact
- Use rescript-react


Vanilla react app

```
$ npx create-react-app rescript-react-intro
$ cd rescript-react-intro
```

```
$ npm install --save-dev bs-platform gentype
$ npm install --save @rescript/react
```

```
$ tree -a -I "\.DS_Store|\.git|node_modules" -N
.
├── .gitignore
├── README.md
├── package-lock.json
├── package.json
├── public
│   ├── favicon.ico
│   ├── index.html
│   ├── logo192.png
│   ├── logo512.png
│   ├── manifest.json
│   └── robots.txt
└── src
    ├── App.css
    ├── App.js
    ├── App.test.js
    ├── index.css
    ├── index.js
    ├── logo.svg
    ├── reportWebVitals.js
    └── setupTests.js
2 directories, 18 files
```

## 3.

new file `bsconfig.json`

```
$ vim bsconfig.json
```

```
{
  "$schema": "https://raw.githubusercontent.com/rescript-lang/rescript-compiler/master/docs/docson/build-schema.json",
  "name": "rescript-react-intro",
  "reason": {
    "react-jsx": 3
  },
  "sources": {
    "dir": "src",
    "subdirs": true
  },
  "bsc-flags": ["-bs-super-errors"],
  "refmt": 3,

  "package-specs": [
    {
      "module": "es6",
      "in-source": true
    }
  ],
  "suffix": ".bs.js",
  "namespace": true,
  "gentypeconfig": {
    "language": "typescript"
  },

  "bs-dependencies": ["@rescript/react"]
}
```

↑↑↑↑↑↑↑↑ [Rescript build configuration](https://rescript-lang.org/docs/manual/latest/build-configuration-schema)

```
...
  "reason": {
    "react-jsx": 3
  }
...
```

reason react-jsx version is 3.

[ReasonReact](https://reasonml.github.io/reason-react/docs/en/jsx)


```
...
  "refmt": 3,
...
```

rescript formatter version is 3.

```
  "suffix": ".bs.js"
```

[docs > Configuration > suffix](https://rescript-lang.org/docs/manual/latest/build-configuration#suffix)

`.js` or `.mjs` or `.cjs` or `.bs.js`

If you want to use genType, use `.bs.js` .

[Why is it recommended to use *.bs.js suffix?](https://forum.rescript-lang.org/t/why-is-it-recommended-to-use-bs-js-suffix/380)


## 4.

```
$ vim package.json
```

```
...
  "scripts": {
    ...
    "start:res": "bsb -make-world -w", # <- add
    ...
  },
...
```

`bsb -make-world -w`

|     |v6.0-8.2|v8.2-v9.0|v9.1|
|:----|:-------|:--------|:---|
|Lang manual link|[link](https://rescript-lang.org/docs/manual/v8.0.0/build-overview)|[link](https://rescript-lang.org/docs/manual/v9.0.0/build-overview)|[link](https://rescript-lang.org/docs/manual/latest/build-overview)|
|Build tool|bsb|bsb|rescript|
|Config|bsconfig.json|bsconfig.json|bsconfig.json|
|To build project|bsb -make-world|bsb -make-world|rescript build|
|Artifacts cleaning|bsb -clean-world|bsb -clean-world|rescript clean|
|Artifact cleaning2|bsb -clean|bsb -clean||

[Docs/Language Manual/Overview/Build System Overview/Build Project](https://rescript-lang.org/docs/manual/v9.0.0/build-overview#build-project)