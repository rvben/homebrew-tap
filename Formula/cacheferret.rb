class Cacheferret < Formula
  desc "Find and safely clean developer caches across macOS and Linux"
  homepage "https://github.com/rvben/cacheferret"
  version "0.4.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/rvben/cacheferret/releases/download/v0.4.2/cacheferret-v0.4.2-aarch64-apple-darwin.tar.gz"
      sha256 "c8c44756f43683f6135465436ce677d607efe85b90c6784a2702422cab221336"
    end

    on_intel do
      url "https://github.com/rvben/cacheferret/releases/download/v0.4.2/cacheferret-v0.4.2-x86_64-apple-darwin.tar.gz"
      sha256 "287b3545676edca7cc1f5fd3a498030b03a3e37e87a9437c08fe2af69904ff44"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/rvben/cacheferret/releases/download/v0.4.2/cacheferret-v0.4.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f1e34e7a003925be980a6d2755783d0b88ace6cb44bd919f7564404e9884878b"
    end

    on_intel do
      url "https://github.com/rvben/cacheferret/releases/download/v0.4.2/cacheferret-v0.4.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "df6d251607859bd1f2895c0a2ce8bd8ead2cdedfcdfecc185ff3ec7348fd3e38"
    end
  end

  def install
    bin.install "cacheferret"
    bash_completion.install "completions/cacheferret.bash" => "cacheferret"
    zsh_completion.install "completions/_cacheferret"
    fish_completion.install "completions/cacheferret.fish"
  end

  test do
    assert_match "\"clispec\": \"0.3\"", shell_output("#{bin}/cacheferret schema")
  end
end
