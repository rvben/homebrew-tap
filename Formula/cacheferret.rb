class Cacheferret < Formula
  desc "Find and safely clean developer caches across macOS and Linux"
  homepage "https://github.com/rvben/cacheferret"
  version "0.3.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/cacheferret/releases/download/v0.3.1/cacheferret-v0.3.1-aarch64-apple-darwin.tar.gz"
      sha256 "339b5a9f0e01cbe5b63a3735027ae49f764993ca2e75a54c07050443d9f1c503"
    else
      url "https://github.com/rvben/cacheferret/releases/download/v0.3.1/cacheferret-v0.3.1-x86_64-apple-darwin.tar.gz"
      sha256 "536a411deb84bbd3614cbc39cf435d0566e659ca736661e37b1db15cdffe2da7"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/cacheferret/releases/download/v0.3.1/cacheferret-v0.3.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "28b752d05b767e59ec8968a41d10539573718f4d62d0e540565e56c5a8d96dda"
    else
      url "https://github.com/rvben/cacheferret/releases/download/v0.3.1/cacheferret-v0.3.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b5399b450ab8e8fe3cd26c82afb25a64a0c460873a1ad07a41154cc40bb59dbe"
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
