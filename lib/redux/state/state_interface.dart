// Class to be extended whenever defining a state-class to be used in redux
// This class when extended will make sure that the state subclass provides implementations for
// == and hashCode (via helper functions having the same functionality)
// to work properly for cleaner and proper state comparision
abstract class ReduxState {
  @override
  bool operator ==(other) => this.compareState(other);

  @override
  int get hashCode => this.getHashCode();

  bool compareState(other);

  int getHashCode();
}
