void defeatScreen() {
    fill(0);
    final String text1 = "GAME OVER",
                 text2 = "Press space to restart";
    textSize(50);
    text(text1, (width - textWidth(text1)) / 2, 300);
    textSize(25);
    text(text2, (width - textWidth(text2)) / 2, 352);
}
