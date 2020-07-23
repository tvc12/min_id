# min_id
Id generator for dart


### Document 📝

#### Syntax ⚔

|    Syntax    |        Range        | Description                                                                                                                                    |  version |
|:------------:|:-------------------:|------------------------------------------------------------------------------------------------------------------------------------------------|:--------:|
|    **abc**   |         ___         | Return string `abc`                                                                                                                            | `^1.0.0` |
|    **{d}**   |       [0 - 9]       | Pick random `1` character from **0 -> 9**                                                                                                      | `^1.0.0` |
|    **{w}**   |  [a - z] or [A - Z] | Pick random `1` character from letter string                                                                                                   | `^1.0.0` |
|    **{.}**   |  [0x0021 - 0x007f]  | Pick random `1` character from **0x0021 -> 0x007f** in `UTF8` charset                                                                          | `^1.0.0` |
|   **(abc)**  |       [a - c]       | Pick random `1` character from **a -> c** (**abc** from input user)                                                                            | `^1.0.0` |
| **{2(abc)}** |       [a - c]       | Pick random `2` characters from **a -> c**                                                                                                     |    ___   |
|  **{2{d}}**  |       [0 - 9]       | Pick random `2` character from **0 -> 9**                                                                                                      |    ___   |
| **(abc{d})** | [a -> c] or [0 - 9] | Nested random:<br>+ Step 1: Pick random `1` character in number range<br>+ Step 2: Pick random `1` character in **a -> c** or result in step 1 |    ___   |
