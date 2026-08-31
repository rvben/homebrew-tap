class Cacheferret < Formula
  desc "Find and safely clean developer caches across macOS and Linux"
  homepage "https://github.com/rvben/cacheferret"
  version "0.5.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/rvben/cacheferret/releases/download/v0.5.2/cacheferret-v0.5.2-aarch64-apple-darwin.tar.gz"
      sha256 "2094ae8347e1755b3056620e2c7749216add974beb6f91527bbe526a84bfc0b9"
    end

    on_intel do
      url "https://github.com/rvben/cacheferret/releases/download/v0.5.2/cacheferret-v0.5.2-x86_64-apple-darwin.tar.gz"
      sha256 "90e615828ba5ae2ecb1da7b7ac2c885d2c3c56466c877dccf4e76a264933ab01"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/rvben/cacheferret/releases/download/v0.5.2/cacheferret-v0.5.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "44b9d95d18a4ad136d7028d95b8796e0a6547d1c2f3e816525482b071b8b8267"
    end

    on_intel do
      url "https://github.com/rvben/cacheferret/releases/download/v0.5.2/cacheferret-v0.5.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3f6298b087c8de47b8ed361f11fa57c533b0cc8ac8d334cd9d04347108eff5b7"
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
