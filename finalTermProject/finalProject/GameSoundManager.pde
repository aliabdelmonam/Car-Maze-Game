import processing.sound.*;

class GameSoundManager {
    // Sound file references
    //private SoundFile backgroundMusic;
    private SoundFile carCrashSound;
    //private SoundFile winSound;
    
    // Reference to parent sketch
    private PApplet parent;
    
    // Volume control
    private float masterVolume = 0.5;
    
    // Constructor
    GameSoundManager(PApplet parent) {
        this.parent = parent;
        loadSounds();
    }
    public GameSoundManager() {
       loadSounds();
    }
    
    // Load all sound files
    private void loadSounds() {
        try {
            //backgroundMusic = new SoundFile(parent, "background_music.mp3");
            carCrashSound = new SoundFile(parent, "car_crash.mp3");
            //winSound = new SoundFile(parent, "win_sound.mp3");
        } catch (Exception e) {
            parent.println("Error loading sound files: " + e.getMessage());
        }
    }
    
    // Play background music
    /*public void playBackgroundMusic() {
        if (backgroundMusic != null) {
            backgroundMusic.loop(); // Loops continuously
            backgroundMusic.amp(masterVolume * 0.5); // Lower volume for background music
        }
    }*/
    
    // Stop background music
    /*public void stopBackgroundMusic() {
        if (backgroundMusic != null) {
            backgroundMusic.stop();
        }
    }*/
    
    // Play crash sound
    public void playCrashSound() {
        if (carCrashSound != null) {
            carCrashSound.play();
            carCrashSound.amp(masterVolume);
        }
    }
    
   /* // Play win sound
    public void playWinSound() {
        if (winSound != null) {
            winSound.play();
            winSound.amp(masterVolume);
        }
    }
    */
    // Adjust master volume
    public void setVolume(float volume) {
        this.masterVolume = constrain(volume, 0, 1);
    }
}
