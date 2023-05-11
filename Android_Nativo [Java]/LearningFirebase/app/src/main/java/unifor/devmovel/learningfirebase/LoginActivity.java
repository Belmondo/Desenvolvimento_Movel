package unifor.devmovel.learningfirebase;

import androidx.annotation.NonNull;
import androidx.appcompat.app.AppCompatActivity;

import android.app.ProgressDialog;
import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.EditText;
import android.widget.Toast;

import com.google.android.gms.tasks.OnFailureListener;
import com.google.android.gms.tasks.OnSuccessListener;
import com.google.android.material.textfield.TextInputLayout;
import com.google.firebase.auth.AuthResult;
import com.google.firebase.auth.FirebaseAuth;


public class LoginActivity extends AppCompatActivity {

    Intent intentNovoUsuario;
    Intent intentLogin;

    TextInputLayout etUsername, etSenha;

    ProgressDialog progressDialog;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_login);
        intentNovoUsuario = new Intent(this, CadastroActivity.class);
        intentLogin = new Intent(this, MainActivity.class);

        etUsername = (TextInputLayout) findViewById(R.id.username);
        etSenha = (TextInputLayout)findViewById(R.id.password);
        progressDialog = new ProgressDialog(this);
    }

    public void login(View view){
        String username = etUsername.getEditText().getText().toString();
        String password= etSenha.getEditText().getText().toString();
        progressDialog.show();

        FirebaseAuth.getInstance().signInWithEmailAndPassword(username, password)
                        .addOnSuccessListener(new OnSuccessListener<AuthResult>() {
                            @Override
                            public void onSuccess(AuthResult authResult) {
                                progressDialog.cancel();
                                Toast.makeText(LoginActivity.this, "Login realizado com sucesso", Toast.LENGTH_SHORT).show();
                                startActivity(intentLogin);

                            }
                        })
                                .addOnFailureListener(new OnFailureListener() {
                                    @Override
                                    public void onFailure(@NonNull Exception e) {
                                        progressDialog.cancel();
                                        Toast.makeText(LoginActivity.this, "Usuário ou senha errados", Toast.LENGTH_SHORT).show();

                                    }
                                });










    }
    public void novo(View view){
        startActivity(intentNovoUsuario);
    }
}