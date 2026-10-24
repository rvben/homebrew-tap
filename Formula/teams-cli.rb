class TeamsCli < Formula
  desc "Manage Microsoft Teams from the terminal"
  homepage "https://github.com/rvben/teams-cli"
  version "0.2.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/teams-cli/releases/download/v0.2.5/teams-cli-v0.2.5-aarch64-apple-darwin.tar.gz"
      sha256 "6f758cb9a61eefc8d42ecc3b11fa14a0fabe84ceb5d08aa78927a6ff88f3ab42"
    else
      url "https://github.com/rvben/teams-cli/releases/download/v0.2.5/teams-cli-v0.2.5-x86_64-apple-darwin.tar.gz"
      sha256 "363182efecbf53d5127863f8efdf6d7c1bf0a14c4cdaaed0d884424020709fad"
    end
  end

  on_linux do
    depends_on "perl" => :build
    depends_on "rust" => :build

    on_arm do
      url "https://static.crates.io/crates/teams-cli/teams-cli-0.2.5.crate"
      sha256 "b2915d4362df52f8396cff5bbe886f730445055ac62bd49f12dd2097003d7a8f"
    end
    on_intel do
      url "https://static.crates.io/crates/teams-cli/teams-cli-0.2.5.crate"
      sha256 "b2915d4362df52f8396cff5bbe886f730445055ac62bd49f12dd2097003d7a8f"
    end
  end

  def install
    if OS.linux?
      system "cargo", "install", *std_cargo_args, "--bin", "teams"
    else
      bin.install "teams"
    end
    bin.install_symlink "teams" => "teams-cli"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/teams --version")
    assert_match version.to_s, shell_output("#{bin}/teams-cli --version")
    assert_match "Usage:", shell_output("#{bin}/teams --help")
  end
end
