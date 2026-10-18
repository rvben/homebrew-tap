class Cacheferret < Formula
  desc "Find and safely clean developer caches across macOS and Linux"
  homepage "https://github.com/rvben/cacheferret"
  version "0.5.5"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/rvben/cacheferret/releases/download/v0.5.5/cacheferret-v0.5.5-aarch64-apple-darwin.tar.gz"
      sha256 "29989a46324349242ccabe13b02ed0fc8794e07c5a1e59f2b2405ec4c46caf1b"
    end

    on_intel do
      url "https://github.com/rvben/cacheferret/releases/download/v0.5.5/cacheferret-v0.5.5-x86_64-apple-darwin.tar.gz"
      sha256 "7c8aa2b2c0b59a0ddf338fc728707602eb4043c1dc953df8a3754eeb06289fb7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/rvben/cacheferret/releases/download/v0.5.5/cacheferret-v0.5.5-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "cdafdcb05f02325aa1e958bdd7fab2e8b9331d045f7e0ba65aa78185cc5734a9"
    end

    on_intel do
      url "https://github.com/rvben/cacheferret/releases/download/v0.5.5/cacheferret-v0.5.5-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "55d6183e0627f4e581d6310eb338929c1de97df4e72e6510c1c0a62c93f7de78"
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
