part of min_id;

abstract class IDGenerator {
  /**
   * **character**  is a number string will generate 🥰
   * 
   * **@return** [String] don't have number only letter 🤚
   */
  String generateString(int character);

  /**
   * **character**  is a number string will generate 🥰
   * 
   * **@return** [String] contains only number 🤚
   */
  String generateNumber(int character);

  /**
   * **character**  is a number string will generate 🥰
   * 
   * **@return** [String] contains special character 🤚
   */
  String generateSpecialCharacter(int character);

  /**
   * **character**  is a number string will generate 🥰
   * 
   * **@return** [String] any thing as character 🤚
   */
  String generate(int character);

  /**
   * **data** is a [List] of [String]. It will appear in final result 🧪
   * 
   * **character**  is a number string will generate 🥰
   * 
   * **@return** [String] any thing as character 🤚
   */
  String generateIn(List<String> data, int character);
}
