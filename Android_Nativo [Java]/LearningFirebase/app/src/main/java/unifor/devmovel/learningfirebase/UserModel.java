package unifor.devmovel.learningfirebase;

public class UserModel {

    public UserModel(String login, String senha, int idade) {
        this.login = login;
        this.senha = senha;
        this.idade = idade;
    }
    public UserModel(){}

    public String getLogin() {
        return login;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    String login, senha;

    public String getSenha() {
        return senha;
    }

    public void setSenha(String senha) {
        this.senha = senha;
    }

    public int getIdade() {
        return idade;
    }

    public void setIdade(int idade) {
        this.idade = idade;
    }

    int idade;

}
