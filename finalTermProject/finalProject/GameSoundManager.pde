import processing.sound.*;

class GameSoundManager {
    // Sound file references
    private SoundFile carCrashSound;
    private SoundFile carWinSound;
    private SoundFile carBoomSound;
    // Reference to parent sketch
    private PApplet parent;
    
    // Volume control
    private float masterVolume = 0.3;
    
    // Constructor
    GameSoundManager(PApplet parent) {
        this.parent = parent;
        loadSounds();
    }
    
    // Load all sound files
    private void loadSounds() {
        try {
            carCrashSound = new SoundFile(parent, "car_crash.mp3");
            carWinSound = new SoundFile(parent, "wn.mp3");
            carBoomSound = new SoundFile(parent,"Boom.mp3");
        } catch (Exception e) {
            parent.println("Error loading sound files: " + e.getMessage());
        }
    }
    
    
    // Play crash sound
    public void playCrashSound() {
        if (carCrashSound != null) {
            if (carCrashSound.isPlaying())
            {
                carCrashSound.stop();
            }
            //carCrashSound.cue(0);
            carCrashSound.play();
            carCrashSound.amp(masterVolume);
        }
    }
    public void playWinSound() {
       if (carWinSound != null) {
            if (carWinSound.isPlaying())
            {
                carWinSound.stop();
            }
            //carWinSound.cue(0);
            carWinSound.play();
            carWinSound.amp(masterVolume);
        }
    }
    public void playBoomSound() {
       if (carBoomSound != null) {
            if (carBoomSound.isPlaying())
            {
                carBoomSound.stop();
            }
            //carWinSound.cue(0);
            carBoomSound.play();
            carBoomSound.amp(.4);
        }
    }
    
 
    // Adjust master volume
    public void setVolume(float volume) {
        this.masterVolume = constrain(volume, 0, 1);
    }
}
