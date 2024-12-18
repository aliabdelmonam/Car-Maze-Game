import processing.sound.*;

class GameSoundManager {
    // Sound file references
    private SoundFile carCrashSound;
    private SoundFile carWinSound;
    
    // Reference to parent sketch
    private PApplet parent;
    
    // Volume control
    private float masterVolume = 0.5;
    
    // Constructor
    GameSoundManager(PApplet parent) {
        this.parent = parent;
        loadSounds();
    }
    
    // Load all sound files
    private void loadSounds() {
        try {
            carCrashSound = new SoundFile(parent, "car_crash.mp3");
            carWinSound = new SoundFile(parent, "winning.mp3");
        } catch (Exception e) {
            parent.println("Error loading sound files: " + e.getMessage());
        }
    }
    
    
    // Play crash sound
    public void playCrashSound() {
        if (carCrashSound != null) {
            carCrashSound.play();
            carCrashSound.amp(masterVolume);
        }
    }
    public void playWinSound() {
        if (carWinSound != null) {
            carWinSound.play();
            carWinSound.amp(masterVolume);
        }
    }
    
 
    // Adjust master volume
    public void setVolume(float volume) {
        this.masterVolume = constrain(volume, 0, 1);
    }
}
