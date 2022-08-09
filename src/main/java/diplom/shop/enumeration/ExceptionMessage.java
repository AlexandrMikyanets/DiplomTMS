package diplom.shop.enumeration;

public enum ExceptionMessage {
    USER_NOT_FOUND_BY_EMAIL("Пользователь с адресом электронной почты не найден"),
    MAIL_IS_TAKEN("Почта уже занята"),
    INVALID_CONFIRM_PASSWORD("Пароли не совпадают"),
    EMPTY_FIELDS("Поля не должны быть пустыми"),
    MESSAGE_IS_EMPTY("Комментарий не должен быть пустым"),
    NOT_DOUBLE_INPUT("Ввод должен быть целым или двойным");

    private final String message;

    ExceptionMessage(String message) {
        this.message = message;
    }

    @Override
    public String toString() {
        return message;
    }
}
