# min_id

Id generator for dart

![Travis (.com)](https://img.shields.io/travis/com/tvc12/min_id?style=flat-square) ![GitHub](https://img.shields.io/github/license/tvc12/min_id?style=flat-square) ![Pub Version](https://img.shields.io/pub/v/min_id?style=flat-square) ![GitHub repo size](https://img.shields.io/github/repo-size/tvc12/min_id?style=flat-square)

### Getting Start ✈

```bash
dependencies:
  min_id: ^1.0.2
```
Install it

```
flutter pub get
```

+ `default` format 🏮

```js
import 'package:min_id/min_id.dart;

final id = MinId.getId();
print(id);// abc-qwe-rty-xzy
```

+ Custom format ✂

```js
import 'package:min_id/min_id.dart;

final id = MinId.getId('{3d}-{3w}-xyz');
print(id);//128-bca-xyz
```

+ Custom global format 🌏

```js
import 'package:min_id/min_id.dart;

MinId.withFormat('{3d}-{3w}-xyz');
final id = MinId.getId();
print(id);//128-bca-xyz
```

### Document 📝

#### Syntax ⚔

|    Syntax    |        Range        | Description                                                                                                                                    |  version |
|:------------:|:-------------------:|------------------------------------------------------------------------------------------------------------------------------------------------|:--------:|
|    **abc**   |         ___         | Return string `abc`                                                                                                                            | `^1.0.0` |
|    **{d}**   |       [0 - 9]       | Pick random `1` character from **0 -> 9**                                                                                                      | `^1.0.0` |
|    **{w}**   |  [a - z] or [A - Z] | Pick random `1` character from letter string                                                                                                   | `^1.0.0` |
|    **{.}**   |  [0x0021 - 0x007f]  | Pick random `1` character from **0x0021 -> 0x007f** in `UTF8` charset                                                                          | `^1.0.0` |
|   **(abc)**  |       [a - c]       | Pick random `1` character from **a -> c** (**abc** from input user)                                                                            | `^1.0.0` |
| **{2(abc)}** |       [a - c]       | Pick random `2` characters from **a -> c**                                                                                                     |    `^1.0.0`   |
|  **{2{d}}**  |       [0 - 9]       | Pick random `2` character from **0 -> 9**                                                                                                      |    `^1.0.0`   |
| **(abc{d})** | [a -> c] or [0 - 9] | Nested random:<br>+ Step 1: Pick random `1` character in number range<br>+ Step 2: Pick random `1` character in **a -> c** or result in step 1 |    `^1.0.0`   |

### Contributors

[![](https://sourcerer.io/fame/tvc12/tvc12/min_id/images/0)](https://sourcerer.io/fame/tvc12/tvc12/min_id/links/0)[![](https://sourcerer.io/fame/tvc12/tvc12/min_id/images/1)](https://sourcerer.io/fame/tvc12/tvc12/min_id/links/1)[![](https://sourcerer.io/fame/tvc12/tvc12/min_id/images/2)](https://sourcerer.io/fame/tvc12/tvc12/min_id/links/2)[![](https://sourcerer.io/fame/tvc12/tvc12/min_id/images/3)](https://sourcerer.io/fame/tvc12/tvc12/min_id/links/3)[![](https://sourcerer.io/fame/tvc12/tvc12/min_id/images/4)](https://sourcerer.io/fame/tvc12/tvc12/min_id/links/4)[![](https://sourcerer.io/fame/tvc12/tvc12/min_id/images/5)](https://sourcerer.io/fame/tvc12/tvc12/min_id/links/5)[![](https://sourcerer.io/fame/tvc12/tvc12/min_id/images/6)](https://sourcerer.io/fame/tvc12/tvc12/min_id/links/6)[![](https://sourcerer.io/fame/tvc12/tvc12/min_id/images/7)](https://sourcerer.io/fame/tvc12/tvc12/min_id/links/7)

### License

[BSD 3-Clause @tvc12](./License)