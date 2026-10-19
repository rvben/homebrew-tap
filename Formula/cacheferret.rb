class Cacheferret < Formula
  desc "Find and safely clean developer caches across macOS and Linux"
  homepage "https://github.com/rvben/cacheferret"
  version "0.5.6"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/rvben/cacheferret/releases/download/v0.5.6/cacheferret-v0.5.6-aarch64-apple-darwin.tar.gz"
      sha256 "fb9ce37e20b5d80aad4e3986f31db8f0a489d1d408728e35830a240fb53f09a3"
    end

    on_intel do
      url "https://github.com/rvben/cacheferret/releases/download/v0.5.6/cacheferret-v0.5.6-x86_64-apple-darwin.tar.gz"
      sha256 "a64f2b98b78cfdb31a5da9743301bb4da37d7d25da4292ef82eb5215f3f9c054"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/rvben/cacheferret/releases/download/v0.5.6/cacheferret-v0.5.6-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "14df47db90ebda5697d7a4e7f48dc51441577dc1bf77e2df86dde32cf2eb819e"
    end

    on_intel do
      url "https://github.com/rvben/cacheferret/releases/download/v0.5.6/cacheferret-v0.5.6-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0b4f201be3897a918e83777366205d6877a72d2623a69199453f65bf94ef79af"
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
