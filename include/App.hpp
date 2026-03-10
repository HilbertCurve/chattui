#pragma once

// TODO: make this singleton
class App {
public:
  /**
   * So far, its only function is to initialize curses.
   */
  App();
  /**
   * So far, its only function is to destroy curses.
   */
  ~App();

  /**
   * So far, it does nothing. No update loop yet until we have curses windows,
   * clients, etc.
   */
  void update();
};
