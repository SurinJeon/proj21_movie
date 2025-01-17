package proj21_movie.dto;

import java.time.LocalDate;
import java.time.LocalTime;

public class ShowInfo {
	private int shwNo;				// 상영정보 번호
	private Theater thtNo;			// 극장 번호
	private Cinema cinNo;			// 상영관 번호
	private Movie movNo;			// 영화 번호
	private LocalDate shwDate;		// 상영일
	private LocalTime shwStarttime;	// 시작 시간
	private LocalTime shwEndtime;	// 종료 시간

	public int getShwNo() {
		return shwNo;
	}

	public void setShwNo(int shwNo) {
		this.shwNo = shwNo;
	}

	public Theater getThtNo() {
		return thtNo;
	}

	public void setThtNo(Theater thtNo) {
		this.thtNo = thtNo;
	}

	public Cinema getCinNo() {
		return cinNo;
	}

	public void setCinNo(Cinema cinNo) {
		this.cinNo = cinNo;
	}

	public Movie getMovNo() {
		return movNo;
	}

	public void setMovNo(Movie movNo) {
		this.movNo = movNo;
	}

	public LocalDate getShwDate() {
		return shwDate;
	}

	public void setShwDate(LocalDate shwDate) {
		this.shwDate = shwDate;
	}

	public LocalTime getShwStarttime() {
		return shwStarttime;
	}

	public void setShwStarttime(LocalTime shwStarttime) {
		this.shwStarttime = shwStarttime;
	}

	public LocalTime getShwEndtime() {
		return shwEndtime;
	}

	public void setShwEndtime(LocalTime shwEndtime) {
		this.shwEndtime = shwEndtime;
	}

}
