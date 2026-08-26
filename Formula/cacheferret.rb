class Cacheferret < Formula
  desc "Find and safely clean developer caches across macOS and Linux"
  homepage "https://github.com/rvben/cacheferret"
  version "0.4.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/cacheferret/releases/download/v0.4.1/cacheferret-v0.4.1-aarch64-apple-darwin.tar.gz"
      sha256 "cd3f03925f1d36814e172c903754771d4d216670fdb78b9831e5e44b56e7157b"
    else
      url "https://github.com/rvben/cacheferret/releases/download/v0.4.1/cacheferret-v0.4.1-x86_64-apple-darwin.tar.gz"
      sha256 "1d30e2173e2f090a9dc6296c0550e455a629de5f8d3f9aab34a1bf59b685143b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/cacheferret/releases/download/v0.4.1/cacheferret-v0.4.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "3520c0993b69408445ea5ffb4526e6e8c202f22d978d8d28894a27ba2a8c171b"
    else
      url "https://github.com/rvben/cacheferret/releases/download/v0.4.1/cacheferret-v0.4.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "acb21bc99b46cf49dd0924b8a4f233ab5ef9164fdb3e4060c786c163434b3020"
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
