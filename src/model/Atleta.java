package model;

public class Atleta {

	private int cod;
	private String nome;
	private boolean sexo;
	private Pais paisOrigem;
	
	public int getCod() {
		return cod;
	}
	
	public void setCod(int cod) {
		this.cod = cod;
	}
	
	public String getNome() {
		return nome;
	}
	
	public void setNome(String nome) {
		this.nome = nome;
	}
	
	public boolean getSexo() {
		return sexo;
	}
	
	public void setSexo(boolean sexo) {
		this.sexo = sexo;
	}
	
	public Pais getPais() {
		return paisOrigem;
	}
	
	public void setPais(Pais paisOrigem) {
		this.paisOrigem = paisOrigem;
	}
}
