# Made for each release from packaging/homebrew/cloofy.rb in https://github.com/parda21/cloofy.
class Cloofy < Formula
  desc "Spotify client for the terminal"
  homepage "https://github.com/parda21/cloofy"
  version "0.4.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/parda21/cloofy/releases/download/v0.4.0/cloofy-aarch64-apple-darwin.tar.gz"
      sha256 "969f71628d77d1ad2cb19b066de0a97574f3899cf9bb571cf7a6bcc8551a4dcf"
    end
    on_intel do
      url "https://github.com/parda21/cloofy/releases/download/v0.4.0/cloofy-x86_64-apple-darwin.tar.gz"
      sha256 "d45fd61472fa8d225dd63809213d2a183a992b485203c21453c4297184dbfe23"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/parda21/cloofy/releases/download/v0.4.0/cloofy-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "184e5ad068cf11af0188841b2263c79c757b2a2b27c9b9704201bbdc37e09459"
    end
    on_intel do
      url "https://github.com/parda21/cloofy/releases/download/v0.4.0/cloofy-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3190ebe999de256a13f7459aa76e08db5ff85354ba0584ca6aa16c2305cbfb16"
    end
  end

  def install
    bin.install "cloofy"
  end

  def caveats
    text = <<~EOS
      cloofy needs Spotify Premium, and a free Spotify app of your own to read
      your library. Create the app and put its client ID into
      ~/.config/cloofy/config.toml, as https://github.com/parda21/cloofy#setup
      describes. Then sign in, and check that everything works:
        cloofy login
        cloofy doctor
    EOS
    if OS.linux?
      text += <<~EOS

        cloofy plays through PulseAudio or PipeWire, with your system's ALSA and
        PulseAudio libraries (libasound2 and libpulse0 on Debian and Ubuntu).
      EOS
    end
    text
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/cloofy --version")
  end
end
