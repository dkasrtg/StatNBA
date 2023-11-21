interface JohanIconInterface{
    path: string,
    width: string,
    height: string,
    fontColor: string,
    backGroundColor: string,
    desc: string,
}
const JohanIcon: React.FC<JohanIconInterface> = ({ path, width, height, fontColor, backGroundColor, desc}) => {
    const style = {
        'width': width,
        'height': height,
        'backgroundColor': backGroundColor,
        'border-radius': '50%',
    }
    return (
        <img src={path} alt={desc} style={style} />
    )
}
export default JohanIcon

